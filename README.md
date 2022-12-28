# ▶️ 👉🏻 🗑 Delete Workflow Runs 

Easily mass-delete GitHub Workflow runs from your GitHub remote repository via the command line.

Conventiently select multiple entries to be deleted at once from a navigable list.

It uses the GitHub API, and requires gh (GitHub CLI) and jq (JSON processor).

![](demo.gif)

## QuickStart

1. Install pre-requisites [GitHub CLI](https://github.com/cli/cli), [jq](https://github.com/stedolan/jq), and [fzf](https://github.com/junegunn/fzf) for example on `MacOS`:
    ```sh
    $ brew install gh jq fzf
    ```

2. Install `delete-workflow-runs` globally:
    ```shh
    $ npm i -g delete-workflow-runs
    ```

3. Navigate to the directory of the repository that you wish to delete workflow runs from, then run:
    ```sh
    $ delete-workflow-runs
    ```
4. Use the `<up>` and `<down>` keys to navigate the list of workflow runs, and select the ones to be deleted with `<tab>`.

5. Press `<enter>` to delete the runs from your GitHub remote.

### Docker Quickstart

1. Start Docker container
   ```sh
   $ make start-docker
   ```
2. Install `delete-workflow-runs`
   ```sh
   $ make install
   ```
3. Authenticate to GitHub
   ```sh
   $ gh auth login
   ```
4. Clone your repository where you wish to delete workflow runs from
   ```sh
   $ cd /usr/src
   $ git clone YOUR_REPO
   ```
5. Navigate to the directory of the repository, then run:
    ```sh
    $ cd /usr/src/YOUR_REPO
    $ delete-workflow-runs
    ```


## Contributing
I'd love you to contribute to `@jv-k/delete-workflow-runs`, [pull requests](https://github.com/jv-k/delete-workflow-runs/issues/new/choose) are welcome for submitting issues and bugs!

## License
The scripts and documentation in this project are released under the [MIT license](https://github.com/jv-k/delete-workflow-runs/blob/master/LICENSE).
