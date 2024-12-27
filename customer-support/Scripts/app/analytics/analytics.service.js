analyticsApp.service("analyticsService",function ($http) {
    this.getTickets = function () {
        return $http.get("/api/ticket")
    }
    this.getTicket = function (ticketId) {
        var getRequestUri = "/api/ticket/" + ticketId;
        return $http.get(getRequestUri);
    }
})