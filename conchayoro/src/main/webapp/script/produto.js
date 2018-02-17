var app = angular.module("produtoGerenciador",[]);

app.controller("produtoController", function ($scope, $http) {
	 
	$scope.produtos = [];
    $scope.produtoForm = {
         id : -1,
         nome : '',
         unidade : '',
         precoUnitario : 0.0
     };
    
    _refreshGrid();     
	
	$scope.gravar = function() {
        
        var method = '';
        var url = '';
        if ($scope.produtoForm.id == -1) {
            method = 'POST';
            url = 'rest/produto/incluir';
        } else {
            method = 'PUT';
            url = 'rest/produto/alterar';
        }

        $http({
            method : method,
            url : url,
            data : angular.toJson($scope.produtoForm),
            headers : {
                'Content-Type' : 'application/json'
            }
        }).then( _success, _error );
    };
    
    $scope.excluir = function(produto) {
        $http({
            method : 'DELETE',
            url : 'rest/produto/excluir/' + produto.id
        }).then(_success, _error);
        
    };

    $scope.editar = function(produto) {    	
        $scope.produtoForm.id = produto.id;
        $scope.produtoForm.nome = produto.nome;
        $scope.produtoForm.unidade= produto.unidade;
        $scope.produtoForm.precoUnitario = produto.precoUnitario;
        };

    
    function _refreshGrid() {
        $http({
            method : 'GET',
            url : 'rest/produto/listar'
        }).then(function successCallback(response) {
            $scope.produtos = response.data;
        }, function errorCallback(response) {
            console.log(response.statusText);
        });
    };
    
    function _success(response) {
        _refreshGrid();
        _clearFormData();
    }

    function _error(response) {
        console.log(response.statusText);
    }

    function _clearFormData() {
        $scope.produtoForm.id = -1;
        $scope.produtoForm.nome = "";
        $scope.produtoForm.unidade= "";
        $scope.produtoForm.precoUnitario = 0;
    
    };
});

