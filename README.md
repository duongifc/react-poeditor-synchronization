# React/React native POEditor synchronization

### Installation

 * Open `package.json`
 * Add to `devDependencies`:
```json
	"dependencies": {
		"poeditor": "git+https://github.com/duongifc/POEditor-sh.git"
	}
```

 * Setup npm script:
```json
	"scripts": {
		"poeditor": "node_modules/poeditor-sh/exports.sh src/config/poeditor.json",
		"poeditor-setup": "node_modules/poeditor-sh/setup.sh",
		"poeditor-list-projects": "node_modules/poeditor-sh/list_projects.sh src/config/poeditor.json",
		"poeditor-list-languages": "node_modules/poeditor-sh/list_languages.sh src/config/poeditor.json"
	}
```
   Example: `src/config/poeditor.json`
 * File contents are saved in the URL so you can share files

RUN `poeditor-setup` TO SETUP REQUIREMENTS

Let's start with `CONFIG` json file:
* `api_key`: get it from [POEdtior API].
* `project_id`: run command `npm run poeditor-list-projects` to get list of project ids.
* `languages: run command `npm run poeditor-list-languages` to get list of language ids.
* `file_format`: apple_strings, android_strings, json
* `path`: saved path for return data from POEditor
```json
{
  "api_key": "0791fc384c6011ddfa7df3656ffd6529",
  "project_id": "79427",
  "languages": "en,vi",
  "file_format": "json",
  "file_name": "Localize",
  "path": "src/i18n"
}

```

[POEeditor API]: <https://poeditor.com/account/api>
