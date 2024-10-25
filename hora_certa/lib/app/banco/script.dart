const criarTabelas = {
  '''
    CREATE TABLE cliente(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,cpf VARCHAR(14) NOT NULL UNIQUE
      ,telefone VARCHAR(20) NOT NULL
      ,senha VARCHAR(200) NOT NULL
      ,telefoneEhWhatsapp CHAR(1) NOT NULL
      ,estaAtivo CHAR(1) NOT NULL
      ,observacao VARCHAR(200)
      );

    CREATE TABLE atendente(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,cpf CHAR(14) NOT NULL UNIQUE
      ,estaAtivo CHAR(1) NOT NULL
      ,observacao VARCHAR(200)
      );
  '''
};

const inserirRegistros = {
  '''
    INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo, observacao)VALUES("JONAS, "301.650.590-42", "44997400880", "Senha123", "S", "S", "");
    INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo, observacao)VALUES("JOAO, "301.650.590-41", "44997400881", "Senha213", "S", "N", "");
    INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo, observacao)VALUES("JOEDSON , "301.650.590-40", "44997400882", "Senha321", "N", "S", "");
    
    INSERT INTO atendente (nome, cpf, senha, estaAtivo, observacao)VALUES("CARLOS, "301.650.590-43", "44997400883", "Senha231", "S", "S", "");
    INSERT INTO atendente (nome, cpf, senha, estaAtivo, observacao)VALUES("CAMILA, "301.650.590-44", "44997400884", "Senha132", "S", "N", "");
    INSERT INTO atendente (nome, cpf, senha, estaAtivo, observacao)VALUES("CAROL , "301.650.590-45", "44997400885", "Senha312", "N", "S", "");
  '''
};
