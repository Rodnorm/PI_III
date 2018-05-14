<%-- 
    Document   : CadastroImoveis
    Created on : May 4, 2018, 3:51:31 PM
    Author     : I864970
--%>

<%@page import="br.com.evolution.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro - Imóveis</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script><!--includeHTML-->
        <script type="text/javascript" >

            
            
            function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('rua').value = ("");
            document.getElementById('bairro').value = ("");
            document.getElementById('cidade').value = ("");
            document.getElementById('uf').value = ("");
            }

            function meu_callback(conteudo) {
            if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('rua').value = (conteudo.logradouro);
            document.getElementById('bairro').value = (conteudo.bairro);
            document.getElementById('cidade').value = (conteudo.localidade);
            document.getElementById('uf').value = (conteudo.uf);
            } //end if.
            else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("CEP não encontrado.");
            }
            }

            function pesquisacep(valor) {

            //Nova variável "cep" somente com dígitos.
            var cep = valor.replace(/\D/g, '');
            //Verifica se campo cep possui valor informado.
            if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;
            //Valida o formato do CEP.
            if (validacep.test(cep)) {

            //Preenche os campos com "..." enquanto consulta webservice.
            document.getElementById('rua').value = "...";
            document.getElementById('bairro').value = "...";
            document.getElementById('cidade').value = "...";
            document.getElementById('uf').value = "...";
            //Cria um elemento javascript.
            var script = document.createElement('script');
            //Sincroniza com o callback.
            script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';
            //Insere script no documento e carrega o conteúdo.
            document.body.appendChild(script);
            } //end if.
            else {
            //cep é inválido.
            limpa_formulário_cep();
            alert("Formato de CEP inválido.");
            }
            } //end if.
            else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
            }
            }
            ;
            function pesquisaCliente() {
            var cpf = document.getElementById('cpf').value;
            //Verifica se o campo cpf possui algum valor
            if (cpf != "") {
            document.location.href = "${pageContext.request.contextPath}/cliente?comando=buscaCliente&cpfCliente=" + cpf;
            document.getElementById('proprietario').value = ("${clienteP.nome}");
            } else {
            alert("CPF inválido!");
            }
            }

        </script>

    </head>
    <body>
        <div w3-include-html="menu.html"></div>
        <script>
            w3IncludeHTML();
        </script>
        <div class="main">
            <div class="container">
                <div class="row centered-form">

                    <div >
                        <br>
                        <br>
                        <br>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Cadastro de Imóveis</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form"  method="POST">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-xs-auto col-sm-auto col-md-6">

                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label for="dataCad" class="control-label">Data</label>
                                                        </div>

                                                        <input type="text" name="dataCad" id="dataCad" class="form-control input-sm" placeholder="DD/MM/AA">
                                                    </div>

                                                </div>

                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="servico">Servico</label>
                                                            <select id="Servico" name="Servico" class="form-control">
                                                                <option>Selecione</option>
                                                                <option>Venda</option>
                                                                <option>Locação</option>                                                    
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="categoria">Categoria</label>
                                                        </div>	
                                                        <select id="categoria" name="categoria" class="form-control">
                                                            <option>Selecione</option>
                                                            <option>Residencial</option>
                                                            <option>Comercial</option>
                                                            <option>Rural</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-xs-auto col-sm-auto col-md-6">	
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="tipo">Tipo do Imóvel</label>
                                                        </div>	
                                                        <select id="tipo" name="tipo" class="form-control">
                                                            <option>Selecione</option>
                                                            <option>Apartamento</option>
                                                            <option>Casa</option>
                                                            <option>Terreno</option>
                                                        </select>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="row">
                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="col-25">
                                                        <label class="control-label" for="cpf">CPF</label>
                                                    </div>	
                                                    <input type="text" name="cpf" id="cpf" class="form-control" placeholder="CPF">
                                                    <br>
                                                    <a href="#" class="btn btn-info" onclick="pesquisaCliente()">Buscar</a>							
                                                </div>

                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="proprietario">Proprietário</label>
                                                        </div>	
                                                        <input type="text" name="proprietário" id="proprietario" class="form-control input-sm">
                                                       <!-- <input type="hidden" id="idCliente" name="idCliente" value="${clienteP.idCliente}">-->

                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="situacao">Status do Imóvel</label>
                                                        </div>	
                                                        <select id="situacao" name="situacao" class="form-control">
                                                            <option>Selecione</option>
                                                            <option value="livre">Livre</option>
                                                            <option value="ocupado">Ocupado</option>
                                                        </select>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                                        <div class="form-group">
                                                            <div class="col-25">
                                                                <label class="control-label" for="valorVenda">Valor de venda*</label>
                                                            </div>	
                                                            <input type="text" name="valorVenda" id="valorVenda" class="form-control input-sm" placeholder="Valor">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                                        <div class="form-group">
                                                            <div class="col-25">
                                                                <label class="control-label" for="valorAluguel">Valor de aluguel*</label>
                                                            </div>	
                                                            <input type="text" name="valorAluguel" id="valorAluguel" class="form-control input-sm" placeholder="Valor">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                                        <div class="form-group">
                                                            <div class="col-25">
                                                                <label class="control-label" for="condominio">Condomínio</label>
                                                            </div>	
                                                            <input type="text" name="condominio" id="condominio" class="form-control input-sm" placeholder="Condomínio">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                                        <div class="form-group">
                                                            <div class="col-25">
                                                                <label class="control-label" for="iptu">IPTU</label>
                                                            </div>	
                                                            <input type="text" name="iptu" id="iptu" class="form-control input-sm" placeholder="IPTU">
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>

                                        <div class="col-xs-auto col-sm-auto col-md-6">
                                            <div>
                                                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                                    <!-- Indicators -->
                                                    <ol class="carousel-indicators">
                                                        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                                                        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                                                        <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
                                                    </ol>
                                                    <div class="carousel-inner" role="listbox">
                                                        <div class="item active">
                                                            <img class="first-slide"  src="img/1.jpeg" alt="Foto da casa">

                                                        </div>
                                                        <div class="item">
                                                            <img class="second-slide" src="img/2.jpeg" alt="Foto da casa">

                                                        </div>
                                                        <div class="item">
                                                            <img class="third-slide" src="img/3.jpeg" alt="Foto da casa">

                                                        </div>
                                                    </div>
                                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>

                                                    </a>
                                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>

                                                    </a>

                                                </div><!--carousel-->

                                                <label for="imagens">Selecionar um arquivo &#187;</label>
                                                <input id="imagens" type="file" accept="image/x-png,image/gif,image/jpeg" onChange="previewFile()">

                                            </div><!--DIV DO CAROUSEL-->	
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="col-25">
                                                    <label class="control-label" for="info">Outras Informações</label>
                                                </div>	
                                            </div>
                                            <div class="form-group">
                                                <textarea class="form-control" rows="4" id="info"></textarea>
                                            </div>


                                        </div>
                                    </div>

                                    <div class="row"> 
                                        <hr>
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Dependencias</h3>

                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="quartos">Quartos</label>
                                                </div>	
                                                <input type="text" name="quartos" id="quartos" class="form-control input-sm" placeholder="Quartos">
                                            </div>
                                        </div>

                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="banheiros">Banheiros</label>
                                                </div>	
                                                <input type="text" name="banheiros" id="banheiros" class="form-control input-sm" placeholder="banheiros">
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="suites">Suítes</label>
                                                </div>	
                                                <input type="text" name="suites" id="suites" class="form-control input-sm" placeholder="Suítes">
                                            </div>
                                        </div>

                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="vagasGaragem">Vagas na Garagem</label>
                                                </div>	
                                                <input type="text" name="vagasGaragem" id="vagasGaragem" class="form-control input-sm" placeholder="Vagas">
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="areaUtil">Área útil</label>
                                                </div>	
                                                <input type="text" name="areaUtil" id="areaUtil" class="form-control input-sm" placeholder="Área útil">
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="areaTotal">Área total</label>
                                                </div>	
                                                <input type="text" name="areaTotal" id="areaTotal" class="form-control input-sm" placeholder="Área total">
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-6">								
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Localização</h3>									
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-6">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="cep">CEP</label>
                                                    </div>	
                                                    <input type="text" name="cep" id="cep" class="form-control input-sm" placeholder="CEP"onblur="pesquisacep(this.value);">
                                                    <br>
                                                    <button type="button" class="btn btn-info">Buscar</button>
                                                </div>
                                            </div>

                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="rua">Rua</label>
                                                    </div>	
                                                    <input type="text" name="rua" id="rua" class="form-control input-sm" placeholder="Rua">
                                                </div>
                                            </div>

                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="bairro">Bairro</label>
                                                    </div>	
                                                    <input type="text" name="bairro" id="bairro" class="form-control input-sm" placeholder="Bairro">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-6">

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="num">Número</label>
                                                    </div>	
                                                    <input type="text" name="num" id="num" class="form-control input-sm" placeholder="Número">
                                                </div>
                                            </div>
                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="complemento">Complemento</label>
                                                    </div>	
                                                    <input type="text" name="complemento" id="complemento" class="form-control input-sm" placeholder="Complemento">
                                                </div>
                                            </div>

                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="cidade">Cidade</label>
                                                    </div>	
                                                    <input type="text" name="cidade" id="cidade" class="form-control input-sm" placeholder="Cidade">
                                                </div>
                                            </div>
                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="uf">UF</label>
                                                    </div>	
                                                    <input type="text" name="uf" id="uf" class="form-control input-sm" placeholder="UF">
                                                </div>
                                                <input type="hidden" name="comando" id="comando" value="cadastrar"/>
                                            </div>
                                        </div>		
                                    </div>
                                    <hr>


                                    <div class="row">
                                        <br>
                                        <div class="col-xs-auto col-sm-auto col-md-6">
                                            <button type="button submit" class="btn btn-info" >Salvar</button>
                                            <button type="button" class="btn btn-danger" >Cancelar</button>
                                        </div>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
