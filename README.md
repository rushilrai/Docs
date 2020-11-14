# Docs

An app for digitally signing prescription and ensuring legitimacy for e-pharmacies.

## Development

### API Server (Node.js)

Assuming you have `Node.js` installed, you can host this locally as follows:

* Install (or Update) your `node_modules`.

```bash
npm install
```

* Run the development server (Hot-reloading should be enabled).

```bash
npm run dev
```

* Requests

  * For Sign-up: `/POST`

  ```json
  {

    "_id": "johndoe@example.com",
    "password": "johnDOE@2000",
    "name": "John Doe",
    "contact_no": "9999999999",
    "address": "Example Address",
    "role": "Patient | Doctor",
    "docprofile": {}
  }
  ```

  * For Log-in: `/POST`

  ```json
  {
    "_id": "johndoe@example.com",
    "password": "johnDOE@2000"
  }

  ```
