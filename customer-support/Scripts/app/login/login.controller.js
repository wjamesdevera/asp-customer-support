loginApp.controller("loginController", function ($scope, loginService) {
    const MAX_LOGIN_PAGE = 2;
    let email = "";
    $scope.loginPage = 1;

    $scope.loginNext = function () {
        email = $scope.email;

        if (email == null || email === "") {
            $scope.emailErrorMessage = "Please enter an email";
            return
        }

        if (!isValidEmail(email)) {
            $scope.emailErrorMessage = "Please enter a valid email";
            return
        }

        if (!(($scope.loginPage + 1) > MAX_LOGIN_PAGE)) {
            $scope.loginPage++;
            $scope
        }

        $scope.emailErrorMessage = null;
    }

    $scope.loginPrev = function () {
        $scope.email = email;
        if (!(($scope.loginPage + 0) <= 0)) {
            $scope.loginPage--;
        }
    }

    $scope.login = function () {
        const password = $scope.password;
        if (password == null || password === "") {
            $socpe.loginErrorMessage = "Please enter a password";
            return 
        }

        loginService.login(email, password).then(function (response) {
            console.log(response);
            if (response.data.status === "success" && response.status === 200) {
                const userId = response.data.data.userId;
                const userEmail = response.data.data.user;
                sessionStorage.setItem("user_id", userId);
                sessionStorage.setItem("user_email", userEmail);
                $scope.email = ""
                $scope.password = ""
                $scope.loginErrorMessage = null;
                window.location.href = "/home";
            }
        }, function (error) {
            $scope.password = "";
            $scope.loginErrorMessage = "Your account or password is incorrect.";
        });
    }

    $scope.registerNext = function () {
        email = $scope.email;

        if (email == null || email === "") {
            $scope.emailErrorMessage = "Please enter an email";
            return
        }

        if (!isValidEmail(email)) {
            $scope.emailErrorMessage = "Please enter a valid email";
            return
        }

        loginService.checkEmail(email).then(
            function (response) {
                $scope.emailErrorMessage = "Email already exists";
                console.log('Email already exists');
            },
            function (error) {
            if (!(($scope.loginPage + 1) > MAX_LOGIN_PAGE)) {
                $scope.loginPage++;
                $scope
            }
            $scope.emailErrorMessage = null;
        })


    }

    $scope.register = function () {
        if (!isValidEmail($scope.email) && !isValidPassword($scope.password)) {
            console.log("Invalid Email or Password")
            return;
        }

    }
})