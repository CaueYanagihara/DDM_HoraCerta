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
''',
  '''
    CREATE TABLE atendente(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,cpf CHAR(14) NOT NULL UNIQUE
      ,senha VARCHAR(200) NOT NULL
      ,estaAtivo CHAR(1) NOT NULL
      ,observacao VARCHAR(200)
      );
  ''',
  '''
    CREATE TABLE servico(
      id INTEGER NOT NULL PRIMARY KEY,
      nome VARCHAR(200) NOT NULL,
      preco INTEGER NOT NULL,
      tempo VARCHAR(20) NOT NULL,
      estaAtivo CHAR(1) NOT NULL,
      observacao VARCHAR(200)
    );
  ''',
  '''
    CREATE TABLE agenda(
      id INTEGER NOT NULL PRIMARY KEY,
      clienteId INTEGER NOT NULL,
      servicoId INTEGER NOT NULL,
      atendenteId INTEGER NOT NULL,
      dataHoraInicio DATETIME NOT NULL,
      dataHoraFim DATETIME NOT NULL,
      preco INTEGER NOT NULL,
      status CHAR(1) NOT NULL,
      observacao VARCHAR(200),
      FOREIGN KEY(clienteId) REFERENCES cliente(id),
      FOREIGN KEY(servicoId) REFERENCES servico(id),
      FOREIGN KEY(atendenteId) REFERENCES atendente(id)
    );
  '''
};

const inserirRegistros = {
  '''
    INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo, observacao)VALUES("JONAS", "301.650.590-42", "44997400880", "Senha123", "S", "S", "");
    INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo, observacao)VALUES("JOAO", "301.650.590-41", "44997400881", "Senha213", "S", "N", "");
    INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo, observacao)VALUES("JOEDSON", "301.650.590-40", "44997400882", "Senha321", "N", "S", "");
  ''',
  '''
    INSERT INTO atendente (nome, cpf, senha, estaAtivo, observacao)VALUES("CARLOS", "775.663.160-95", "Senha231", "S", "");
    INSERT INTO atendente (nome, cpf, senha, estaAtivo, observacao)VALUES("CAMILA", "116.019.780-65", "Senha132", "S", "");
    INSERT INTO atendente (nome, cpf, senha, estaAtivo, observacao)VALUES("CAROL" , "480.850.780-31", "Senha312", "N", "");
  ''',
  '''
    INSERT INTO servico (nome, preco, tempo, estaAtivo, observacao) VALUES ("Corte de Cabelo", 50, "00:30", "S", "");
    INSERT INTO servico (nome, preco, tempo, estaAtivo, observacao) VALUES ("Manicure", 30, "00:45", "S", "");
    INSERT INTO servico (nome, preco, tempo, estaAtivo, observacao) VALUES ("Pedicure", 40, "00:50", "S", "");
  ''',
  '''
    INSERT INTO agenda (clienteId, servicoId, atendenteId, dataHoraInicio, dataHoraFim, preco, status, observacao) VALUES (1, 1, 1, "2023-10-01 10:00:00", "2023-10-01 10:30:00", 50, "P", "");
    INSERT INTO agenda (clienteId, servicoId, atendenteId, dataHoraInicio, dataHoraFim, preco, status, observacao) VALUES (2, 2, 2, "2023-10-01 11:00:00", "2023-10-01 11:45:00", 30, "P", "");
    INSERT INTO agenda (clienteId, servicoId, atendenteId, dataHoraInicio, dataHoraFim, preco, status, observacao) VALUES (3, 3, 3, "2023-10-01 12:00:00", "2023-10-01 12:50:00", 40, "P", "");
  '''
};
