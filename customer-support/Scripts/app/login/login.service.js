loginApp.service("loginService", function ($http) {
    this.login = function (email, password) {
        return $http({
            method: 'POST',
            url: '/api/auth/login',
            headers: 'application/json',
            data: {
                email: email,
                password: password
            }
        });
    }
});