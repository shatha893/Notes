const jwt = require('jsonwebtoken')

console.log(jwt.sign({ _id: "6114654d77f9a54e00f05777", name: "theadmin" , email: "root@dasith.works"}, "secret" ));
