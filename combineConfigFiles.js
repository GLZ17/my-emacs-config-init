const {resolve} = require('path');
const fs = require('fs');

class Emacs {
    constructor(root) {
        this.root = resolve(root);
        this.clear();
    }

    _isFile(path) {
        return fs.lstatSync(path).isFile()
    }

    _initFilenames(path) {
        if (this._isFile(path)) {
            this.filenames.push(path);
        } else {
            fs.readdirSync(path).forEach(it => this._initFilenames(resolve(path, it)));
        }
    }

    clear() {
        this.filenames = [];
        this.file_stream = [];
        this.string = '';
    }

    createFilenames() {
        this._initFilenames(this.root);
        return this;
    }

    readFiles() {
        this.file_stream = this.filenames.map(it => fs.readFileSync(it));
        return this;
    }

    joinFiles(glue = '\n\n') {
        this.string = this.file_stream
            .map(it => it.toString())
            .map(it=>it.replace(/[\r]/g, ''))
            .join(glue)
        return this;
    }

    output(pathname) {
        fs.writeFileSync(pathname, this.string);
        return this;
    }
}

new Emacs('./config')
    .createFilenames()
    .readFiles()
    .joinFiles()
    .output('./init.el');
console.log('^__^');