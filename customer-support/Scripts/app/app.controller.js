app.controller("ticketController", function ($scope, ticketService) {

    $scope.message = "Hello World!!"
    $scope.isLoading = true;
    $scope.isLoggedIn = false;


    $scope.init = function () {
        if (isLoggedIn()) {
            $scope.isLoggedIn = true;
            $scope.userId = sessionStorage.getItem("user_id");
            $scope.userEmail = sessionStorage.getItem("user_email");
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
});