app.controller("ticketController", function ($scope, ticketService) {

    $scope.message = "Hello World!!"
    $scope.isLoading = true;
    $scope.isLoggedIn = false;


    $scope.init = function () {
        if (isLoggedIn()) {
            $scope.isLoggedIn = true;
            $scope.userId = sessionStorage.getItem("user_id");
            $scope.userEmail = sessionStorage.getItem("user_email");
            $scope.userFirstName = sessionStorage.getItem("user_first_name");
        }

        fetchTickets();
    }

    let isLoggedIn = function () {
        const userId = sessionStorage.getItem("user_id");
        const userEmail = sessionStorage.getItem("user_email");

        if (userId === null || userEmail === null) {
            return false;
        }
        return true;
    }

    let fetchTickets = function () {
        ticketService.getTickets().then((response) => {
            $scope.tickets = response.data.tickets
            $scope.numberOfQuestions = response.data.tickets.length;
        }).finally(() => {
            $scope.isLoading = false;
        });
    }


    $scope.fetchTicket = function (ticketId) {
        ticketService.getTicket(ticketId).then((response) => {
            $scope.ticket = response.data;
        });
    }


    $scope.askAQuestionButton = function () {
        console.log("clicked")
        if (!$scope.isLoggedIn) {
            window.location.href = '/home/login'
        } else {
            window.location.href = '/home/createticket'
        }
    }


    $scope.ticketTitle = "";
    $scope.ticketDescription = "";
    $scope.createTicketErrorMessage = null;


    $scope.postQuestion = function () {
        if ($scope.ticketTitle === "" || $scope.ticketTitle === null) { 
            return
        }

        if ($scope.ticketDescription === "" || $scope.ticketDescription === null) {
            return
        }

        if (!$scope.isLoggedIn) {
            return
        }


        ticketService.createTicket($scope.userId, $scope.ticketTitle, $scope.ticketDescription).then(function (response) {
            const ticket = response.data;
            window.location.href = '/home/ticket/' + ticket.Id;
        }, function (error) {

        })
    }

    $scope.truncateText = function (text) {
        const MAX_CHARACTERS = 500
        if (text.length <= MAX_CHARACTERS) {
            return text;
        }
        return text.substring(0, MAX_CHARACTERS) + "...";
    }
    $scope.submitComment = function (ticketId) {
        const comment = $scope.userComment; 
        ticketService.postComment($scope.userId, ticketId, comment).then(function (response) {
            window.location.href = '/home/ticket/' + ticketId
        }).catch(function (error) {
        })
    }

    $scope.fetchComments = function (ticketId) {
        ticketService.getComments(ticketId).then(function (response) {
            $scope.comments = response.data.comments;
        });
    }

    $scope.printInput = function () {
        console.log($scope.userComment)
    }

    $scope.logoutVisible = false;
    $scope.toggleLogoutVisible = function () {
        $scope.logoutVisible = !$scope.logoutVisible;
    }

    $scope.logout = function () {
        console.log("LOGOUT CLICKED")
        $scope.isLoggedIn = false;
        sessionStorage.removeItem("user_id");
        sessionStorage.removeItem("user_email");
        sessionStorage.removeItem("user_first_name");
    }
});