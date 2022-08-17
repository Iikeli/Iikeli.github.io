---
date: 2022-08-17 12:50
description: Create and publish your personal website using GitHup Pages, Publish and Swift.
tags: website, article, tutorial
---
# Create a website with Publish and GitHub Pages

In this tutorial I will show you how to create a website using Publish and GitHub Pages. I'm focusing on the "organization" style page, since I am creating my own personal website. If you want to follow along in code, I am using a git branch for this that you can find [here](https://github.com/Iikeli/Iikeli.github.io/tree/publish-tutorial).

## GitHub Pages

[GitHub Pages](https://pages.github.com) is a service that GitHub provides for publishing a website for you, a company, or a project. For free you get one site per GitHub account and organization,
and unlimited project sites. It's a perfect way to host basic websites as a developer and it's why I'm moving my websites from Webflow to GitHub Pages to save on costs.

### Setting up your GitHub Pages website

The setup for GitHub Pages is really simple: just follow the step-by-step instructions on [the front page](https://pages.github.com).

1. Create a repository with the name `*ORG_NAME*.github.io`. Note that the *ORG_NAME* needs to match the username/organization name exactly, otherwise it won't work.
2. Clone the repository created `$ git clone https://github.com/*ORG_NAME*/*ORG_NAME*.github.io`
3. Navigate to the folder `$ cd *ORG_NAME*.github.io`
4. Create an `index.html` file with `$ echo "Hello World" > index.html`
5. Push the new file to the git repo `$ git add .` -> `$ git commit -m "Initial commit"` -> `git push`

That's it for the setup. The new site will be running at `https://*ORG_NAME*.github.io` when the automatically provided GitHub action finishes running.

## Publish

[Publish](https://github.com/JohnSundell/Publish) is a static site generator build for Swift developers by John Sundell. It enables websites to be build using Swift, supports themes, plugins, etc. The Publish framework is used to create John Sundells site [swiftbysundell](https://www.swiftbysundell.com).

### Setup

Publish comes with a command line setup tool and you can install it using Homebrew by running `$ brew install publish`.

For us to be able to setup our website using publish, we need to empty the directory for our website before being able to run `$ publish new` to create all the files we need. I simply moved the index.html to the desktop, ran `$ publish new`, and copied it back for clarity.