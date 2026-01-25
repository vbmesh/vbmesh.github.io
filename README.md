# vbmesh.github.io
docs for vbmesh

## Contributing:
Feel free to add contributions!

### local development:
#### Through nix (recommended)
```bash
nix develop
```
This will automatically set up your development environment with all dependencies.

#### Through Ruby
- Make sure Ruby (version 2.7+) and Bundler installed
- Nokogiri Dependencies:
    - for macOS: brew install libxml2 libxslt
    - Debian/Ubuntu based: sudo apt-get install build-essential libxml2-dev libxslt-dev zlib1g-dev
    - Fedora: sudo dnf install gcc make libxml2-devel libxslt-devel zlib-devel

#### All Users:
1. Install Dependencies:
```bash
bundle install
```
this will install all dependencies in your directory (first time only)

2. Run development server:
```bash
bundle exec jekyll serve --livereload --drafts
```

3. View test-site at http://localhost:4000


