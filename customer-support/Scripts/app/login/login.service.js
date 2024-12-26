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

    this.register = function (email, password) {
        return $http({
            method: 'POST',
            url: '/api/auth/register',
            headers: 'application/json',
            data: {
                email: email,
                password: password
            }
        });
    }

    this.checkEmail = function (email) {
        let getRequestUrl = '/api/auth?userEmail=' + email
        return $http.get(getRequestUrl);
    }

});