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
      id PRIMARY KEY INTEGER NOT NULL
      ,nome VARCHAR(200) NOT NULL
      ,descricao VARCHAR(200)
      ,cpf CHAR(14) NOT NULL UNIQUE
      ,estaAtivo CHAR(1) NOT NULL
      );
  '''
};

const inserirRegistros = {
  'INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo, observacao)VALUES("JOAQUIM, "301.650.590-42", "44997400880", "Senha123", "S", "S")',
  'INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo, observacao)VALUES("JOAO, "301.650.590-41", "44997400881", "Senha213", "S", "N")',
  'INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo, observacao)VALUES("JOH , "301.650.590-40", "44997400882", "Senha321", "N", "S")'
};
