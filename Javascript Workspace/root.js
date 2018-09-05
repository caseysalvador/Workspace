angular.module("root", [])
    .controller("index", ["$scope", function($scope) {
        $scope.favoriteWord;
        $scope.favoriteColor;
        $scope.favoriteShape;
    }]);