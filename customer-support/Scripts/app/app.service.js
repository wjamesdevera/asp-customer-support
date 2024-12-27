app.service("ticketService", function ($http) {
    this.getTickets = function () {
        return $http.get("/api/ticket")
    }

    this.getTicket = function (ticketId) {
        var getRequestUri = "/api/ticket/" + ticketId;
        return $http.get(getRequestUri);
    }

    this.createTicket = function (userId, title, description) {
        return $http({
            method: 'POST',
            url: '/api/ticket',
            headers: {
                'Content-Type': 'application/json'
            },
            data: {
                userId: userId,
                title: title,
                description: description
            }
        })
    }

    this.postComment = function (userId, ticketId, comment) {
        return $http({
            method: 'POST',
            url: '/api/comment',
            headers: {
                'Content-Type': 'application/json'
            },
            data: {
                userId: userId,
                ticketId: ticketId,
                comment: comment
            }
        })
    }

    this.getComments = function (ticketId) {
        var getRequestUri = "/api/comment/" + ticketId;
        return $http.get(getRequestUri);
    }
});