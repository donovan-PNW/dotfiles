module.exports = {
    "env": {
        "browser": true,
        "es6": true
    },
    "extends": "airbnb",
    "globals": {
        "Atomics": "readonly",
        "SharedArrayBuffer": "readonly"
    },
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true
        },
        "ecmaVersion": 2018,
        "sourceType": "module"
    },
    "plugins": [
        "react"
    ],
    "rules": {
      "semi": "warn",
      "no-plusplus": "warn",
      "comma-dangle": "warn",
      "arrow-parens": "warn",
      "quotes": "warn",
      "spaced-comment": "warn",
    }
};
