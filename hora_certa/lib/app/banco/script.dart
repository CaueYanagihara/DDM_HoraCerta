const criarTabelas = {
  '''
    CREATE TABLE professor(
      id PRIMARY KEY INTEGER NOT NULL
      ,nome VARCHAR(200) NOT NULL
      ,descricao VARCHAR(200)
      ,cpf CHAR(14) NOT NULL UNIQUE
      ,status CHAR(1) NOT NULL
      )
  '''
};

const inserirRegistros = {
  'INSERT INTO professor (nome, cpf, status)VALUES("JOAQUIM, "301.650.590-42", "A")',
  'INSERT INTO professor (nome, cpf, status)VALUES("JOAO, "301.650.590-41", "A")',
  'INSERT INTO professor (nome, cpf, status)VALUES("JOH , "301.650.590-40", "I")'
};
