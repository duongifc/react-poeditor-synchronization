# React/React native POEditor synchronization

### Installation

 * Open `package.json`
 * Add to `devDependencies`:
```json
	"dependencies": {
    "poeditor": "git+https://github.com/andonivianez/react-poeditor-synchronization.git",
	}
```

 * Setup npm script:
```json
	"scripts": {
		"poeditor": "node_modules/poeditor/exports.sh src/config/poeditor.json",
		"poeditor-setup": "node_modules/poeditor/setup.sh",
		"poeditor-list-projects": "node_modules/poeditor/list_projects.sh src/config/poeditor.json",
		"poeditor-list-languages": "node_modules/poeditor/list_languages.sh src/config/poeditor.json"
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
* `type`: key_value_json to get an structured json key-value file compatible with most platforms like React Native
```json
{
  "api_key": "0791fc384c6011ddfa7df3656ffd6529",
  "project_id": "79427",
  "languages": "en,es",
  "type": "key_value_json",
  "file_name": "strings",
  "path": "src/i18n",
  "file_format": "json"
}

```

[POEeditor API]: <https://poeditor.com/account/api>
