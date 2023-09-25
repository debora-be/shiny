## Overview

**Shiny Book** is a tool designed to manage and catalog books with unique identifiers known as slugs.

## Prerequisites

- `nix`
- `direnv`

## Setup & Installation

1. Install `nix` if you haven't already:

    ```bash
    curl -L https://nixos.org/nix/install | sh
    ```

2. Navigate to the project directory:

    ```bash
    cd shiny
    ```

3. Allow `direnv`:

    ```bash
    direnv allow
    ```

4. Install necessary gems:

    ```bash
    bundle install
    ```

## Running the Application

1. Start the Rails server:

    ```bash
    rails server
    ```

2. Navigate to the application in your browser or use `curl`:

    - To scrape the URL and populate the database:
    
      ```bash
      curl http://localhost:3000/scrape_books
      ```

    - To view the contents of the `slugs` table:

      ```bash
      curl -H "Accept: application/json" http://localhost:3000/slugs | jq
      ```

    - To view the contents of the `books` table:

      ```bash
      curl -H "Accept: application/json" http://localhost:3000/books | jq
      ```

## Testing

Run the tests using:

```bash
rspec
```