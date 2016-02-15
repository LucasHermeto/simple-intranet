//Ciclo validation
$(document).ready(function() {
	$('#ciclo').validate({
		rules : {
			nome : {
				required : true,
				rangelength : [ 1, 50 ]
			}
		}, // end rules

		messages : {
			nome : {
				required : "Por favor digite um Nome",
				rangelength : "O Nome deve ter no máximo 50 caracteres"
			}
		}, // end messages

		errorPlacement : function(error, element) {
			error.insertAfter(element);
		} // end errorPlacement

	}); // end validade

	// Evangelizer validation
	$('#evangelizer').validate({
		rules : {
			nome : {
				required : true,
			},
			email : {
				required : true,
			},
			senha : {
				required : true,
				rangelength : [ 6, 20 ]
			}
		}, // end rules

		messages : {
			nome : {
				required : "Por favor digite um Nome",
			},
			email : {
				required : "Por favor digite um email",
			},
			senha : {
				required : "Por favor digite uma Senha",
				rangelength : "A senha deve ter de 6 à 20 caracteres"
			}
		}, // end messages

		errorPlacement : function(error, element) {
			error.insertAfter(element);
		} // end errorPlacement

	}); // end validade

	// Topic validation
	$('#topic').validate({
		rules : {
			nome : {
				required : true,
				rangelength : [ 1, 50 ]
			}
		}, // end rules

		messages : {
			nome : {
				required : "Por favor digite um Nome",
				rangelength : "O Nome deve ter no máximo 50 caracteres"
			}
		}, // end messages

		errorPlacement : function(error, element) {
			error.insertAfter(element);
		} // end errorPlacement

	}); // end validade

	// Student validation
	$('#student').validate({
		rules : {
			nome : {
				required : true,
				rangelength : [ 1, 50 ]
			},
			dataNascimento : {
				required : true
			},
			nomeMae : {
				required : true,
				rangelength : [ 1, 50 ]
			},
			nomePai : {
				required : true,
				rangelength : [ 1, 50 ]
			}
		}, // end rules

		messages : {
			nome : {
				required : "Por favor digite um Nome",
				rangelength : "O Nome deve ter no máximo 50 caracteres"
			},
			dataNascimento : {
				required : "Por favor digite uma data de nascimento"
			},
			nomeMae : {
				required : "Por favor digite o Nome da Mãe",
				rangelength : "O Nome da Mãe deve ter no máximo 50 caracteres"
			},
			nomePai : {
				required : "Por favor digite o Nome do Pai",
				rangelength : "O Nome do Pai deve ter no máximo 50 caracteres"
			}
		}, // end messages

		errorPlacement : function(error, element) {
			error.insertAfter(element);
		} // end errorPlacement

	}); // end validade

	// Post validation
	$('#post').validate({
		rules : {
			nome : {
				required : true,
				rangelength : [ 1, 50 ]
			},
			descricao : {
				required : true
			}
		}, // end rules

		messages : {
			nome : {
				required : "Por favor digite um Título",
				rangelength : "O Título deve ter no máximo 50 caracteres"
			},
			descricao : {
				required : "Por favor digite uma descrição"
			},
			file : {
				required : "Por favor insira um arquivo"
			}
		}, // end messages

		errorPlacement : function(error, element) {
			error.insertAfter(element);
		} // end errorPlacement
	}); // end validade
}); // end ready

// Post file validation
function validatePost(file) {
	for (var i = 0; i < file.length; i++) {

		var extension = file[i].name.substr((file[i].name.length - 4),
				file[i].name.length);
		var equals = 0;
		var ext = new Array('docx', '.doc', '.pdf', 'pptx', '.ppt', 'ppsx',
				'.xls', 'xlsx', 'xlsm');
		for (var j = 0; j < ext.length; j++) {
			if (ext[j] == extension) {
				equals++;
			}
		}
		if (equals == 0) {
			alert("Arquivo " + file[i].name + " inválido!");
			return false;
		}
	}
	return true;
}