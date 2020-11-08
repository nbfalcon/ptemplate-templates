# About

Template to generate an Emacs cask project from scratch, with the following
content:
- A Caskfile, set up with ELPA/MELPA, pointing to the plugin's .el file in
  `(package-file)` and depending on ert-runner for development
- A <project-name>.el file, with all necessary comments (ends here, …)
  (interactive snippet) and some package metadata (Author, Version, …)
  
# Configuration

This template requires the variable `user-repo-host` to be a format string
taking a single %s, which, `format`ed with the project name will be used as the
`URL: ` package metadata.

# Dependencies

- `projectile`
