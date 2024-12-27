analyticsApp.controller("analyticsController", function ($scope, analyticsService) {
    $scope.helloMessage = "Analytics Success";
    $scope.tickets = [];
    const barChart = document.getElementById("barChart");
    const lineChart = document.getElementById("lineChart");
    $scope.init = function () {
        fetchTickets();
    }

    let fetchTickets = function () {
        analyticsService.getTickets().then((response) => {
            $scope.tickets = response.data.tickets
            tickets = response.data.tickets;
            tickets.reverse();
            console.log(tickets);
            $scope.numberOfQuestions = response.data.tickets.length;

            let table = new DataTable("#ticketTable", {
                data: $scope.tickets,
                columns: [
                    { data: 'author' },
                    { data: 'title' },
                    { data: 'description' },
                    { data: 'createdAt' }
                ]
            });
            const countByMonth = tickets.reduce((acc, item) => {
                // Extract the month (e.g., "2024-12")
                const month = item.createdAt.slice(0, 7); // "YYYY-MM"
                acc[month] = (acc[month] || 0) + 1;
                return acc;
            }, {})

            const labels = Object.keys(countByMonth);
            const data = Object.values(countByMonth);


            new Chart(barChart, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: '# of Questions',
                        data: data,
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            new Chart(lineChart, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: '# of Questions',
                        data: data,
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });


        }).finally(() => {
            $scope.isLoading = false;
        });
    }


})