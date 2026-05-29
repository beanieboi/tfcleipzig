# 1. TFC Leipzig website

This repository contains the static website for 1. TFC Leipzig e.V. It is built with [Jekyll](https://jekyllrb.com/) and published from the generated `build/` directory.

## Requirements

- Ruby, using the version from `.tool-versions` or `.ruby-version`
- Bundler

If you use `mise` or `asdf`, the Ruby version is read from `.tool-versions`. If you use `rbenv`, it is read from `.ruby-version`.

## Setup

Install the Ruby dependencies:

```sh
bundle install
```

## Run the site locally

Start a local development server:

```sh
bundle exec jekyll serve
```

Then open:

```text
http://localhost:4000
```

Jekyll watches the files and rebuilds automatically while the server is running.

## Build the site

Generate the static files:

```sh
bundle exec jekyll build
```

The generated site is written to `build/`. This directory is ignored by Git because it is generated output.

## Check links and generated HTML

After building, you can run html-proofer against the generated site:

```sh
bundle exec htmlproofer build --disable-external
```

This checks local links, images, and generated HTML. External link checks are disabled here because they can fail due to network issues or temporary problems on other websites.

## Editing content

Common files:

- `index.html`: main homepage content
- `impressum.html`: legal notice and club details
- `_layouts/default.html`: shared page layout, header, navigation, and footer
- `stylesheets/site.css`: custom site styles
- `images/`: images used by the site
- `assets/static/`: downloadable files such as PDFs and logo assets
- `_config.yml`: Jekyll configuration

Most content is plain HTML with a small amount of Jekyll/Liquid syntax, for example:

```html
{{ '/images/tfc_leipzig.png' | relative_url }}
```

Use `relative_url` for links to local files so the site still works if it is deployed under a subpath.

## Contribution workflow

1. Create a new branch for your change.
2. Run `bundle install` if dependencies are not installed yet.
3. Start `bundle exec jekyll serve` and preview the site locally.
4. Edit the relevant files.
5. Run `bundle exec jekyll build`.
6. Optionally run `bundle exec htmlproofer build --disable-external`.
7. Commit your changes and open a pull request.

Please keep generated files from `build/` out of commits.
