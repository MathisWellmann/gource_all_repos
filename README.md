# Gource for multiple repos
This repo contains a script to easily create [`gource`](https://github.com/acaudwell/Gource) visualization for multiple repositories.

## Usage
Enter your desired directory that contains multiple repositories, such as the one where you keep all your personal repositories.
Then execute the script to generate a visualization of all activity in those repos, as such:
```shell
chmod +x ./gource_all_repos.sh
./gource_all_repos.sh
```

This will take a while depending on the complexity of the repos.
Ultimately you will see a `gource.webm` file that you can view.
