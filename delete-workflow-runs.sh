#!/bin/bash

# Name: Delete Workflow Runs
# Author: "John Valai <git@jvk.to>"
# License": "MIT"

# This npm module can be used to easily delete unneeded GitHub Workflow runs 
# from your GitHub remote repository. You can select multiple entries to be 
# deleted at once easily from a navigable list.

# make script exit when a command fails:
set -o errexit 
# if any element of the pipeline fails, then the pipeline as a whole will fail:
set -o pipefail 

# Use supplied repo name, otherwise grab from current repo folder
get_repo_name() {
  [ "$#" -eq 0 ] && repo=$(git remote show origin -n | grep h.URL | sed 's/.*://;s/.git$//') || repo=$1
}

jqscript() {
    cat <<EOF
      def symbol:
        sub("skipped"; "SKIP") |
        sub("success"; "GOOD") |
        sub("failure"; "FAIL");
      def tz:
        gsub("[TZ]"; " ");
      .workflow_runs[]
        | [
            (.conclusion | symbol),
            (.created_at | tz),
            .id,
            .event,
            .name
          ]
        | @tsv
EOF
}

select_runs() {
  gh api --paginate "/repos/$repo/actions/runs" \
    | jq -r -f <(jqscript) \
    | fzf --multi
}

delete_run() {
  local run id result
  run=$1
  id="$(cut -f 3 <<< "$run")"
  gh api -X DELETE "/repos/$repo/actions/runs/$id" --silent \
  && result="Deleted ✅" \
  || result="Failed! ❌"
  printf "%s\t%s\n" "$result" "$run"
}

delete_runs() {
  local id
  while read -r run; do
    delete_run "$run"
    sleep 0.25
  done
}

main() {
  get_repo_name $1
  select_runs | delete_runs
}

main "$@"
