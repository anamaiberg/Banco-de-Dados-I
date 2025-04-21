INSERT INTO Usuario VALUES (1, '12332145623', '67238458', 'Pedro de Souza Rodriguez', 'Pedro', '(47) 89343-2432', 'Rua dos Governadores, 76 - Blumenau', 'pedritorodriguez@hotmail.com', 'propedro1234', TO_DATE('2003-10-11', 'yyyy-MM-dd'), 'M', 'Bahia-BA');
INSERT INTO Usuario VALUES (2, '45678912345', '12345678', 'Mariana Alves Ferreira', 'Mari', '(11) 98765-4321', 'Av. Paulista, 1000 - São Paulo', 'marianaferreira@gmail.com', 'mari1234', TO_DATE('1998-05-22', 'yyyy-MM-dd'), 'F', 'São Paulo-SP');
INSERT INTO Usuario VALUES (3, '78945612378', '87654321', 'Carlos Henrique Lima', 'Carlos', '(21) 97654-3210', 'Rua das Flores, 45 - Rio de Janeiro', 'carloslima@yahoo.com', 'carlim456', TO_DATE('2000-12-15', 'yyyy-MM-dd'), 'M', 'Rio de Janeiro-RJ');
INSERT INTO Usuario VALUES (4, '32165498700', '11223344', 'Fernando Luiz Cardoso', 'Fernando', '(31) 99876-5432', 'Avenida Central, 250 - Belo Horizonte', 'fernandocardoso@mail.com', 'fernando2024', TO_DATE('1995-08-10', 'yyyy-MM-dd'), 'M', 'Minas Gerais-MG');
INSERT INTO Usuario VALUES (5, '85296374155', '55667788', 'Larissa Pinto Oliveira', 'Lari', '(85) 91234-5678', 'Rua das Palmeiras, 89 - Fortaleza', 'larissapoliveira@gmail.com', 'larioliv22', TO_DATE('2002-02-25', 'yyyy-MM-dd'), 'F', 'Ceará-CE');
INSERT INTO Usuario VALUES (6, '14725836999', '99887766', 'Bruno Henrique Costa', 'Bruno', '(51) 97654-1234', 'Praça das Nações, 12 - Porto Alegre', 'brunocosta@yahoo.com', 'brunohc99', TO_DATE('1999-11-30', 'yyyy-MM-dd'), 'M', 'Rio Grande do Sul-RS');

INSERT INTO Aluno VALUES ('202490001213', 'Joao Borges dos Santos', 'Maria de Lurdes Sampaio', 'EEB DOM PEDRO I', 2018, 1);
INSERT INTO Aluno VALUES ('202490001214', 'Ricardo Souza Lima', 'Fernanda Alves Souza', 'Colégio Estadual Tiradentes', 2019, 2);
INSERT INTO Aluno VALUES ('202490001215', 'Ana Clara Mendes', 'Juliana Ribeiro Mendes', 'Instituto Educacional São José', 2020, 3);

INSERT INTO Professor VALUES ('21334355674', 'Mestrado em Pedagogia', 'Departamento de Ciências Exatas e Educação', 4);
INSERT INTO Professor VALUES ('21334355675', 'Doutorado em Matemática', 'Departamento de Matemática e Ciências Naturais', 5);
INSERT INTO Professor VALUES ('21334355676', 'Mestrado em Física', 'Departamento de Ciências Físicas', 6);

INSERT INTO Curso VALUES (4344421, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 8, 840.30);
INSERT INTO Curso VALUES (4344422, 'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus arcu felis, bibendum ut tristique eu, maximus vel est. Etiam euismod urna at efficitur.', 6, 600.00);
INSERT INTO Curso VALUES (4344423, 'Mauris id tempus metus. Suspendisse nec tristique ante. Nam auctor, ligula eu feugiat porttitor, nisi tortor fermentum arcu, sit amet fermentum arcu sapien nec risus.', 10, 1000.50);

INSERT INTO AlunoCurso VALUES ('202490001213', 4344421);
INSERT INTO AlunoCurso VALUES ('202490001214', 4344422);
INSERT INTO AlunoCurso VALUES ('202490001215', 4344423);

INSERT INTO Disciplina VALUES (1, 'Matematica', to_timestamp('06:30:00 PM', 'HH:MI:SS PM'), 3, 'Laboratorio 7', '21334355674');
INSERT INTO Disciplina VALUES (2, 'Física', to_timestamp('08:00:00 AM', 'HH:MI:SS AM'), 2, 'Sala 204', '21334355675');
INSERT INTO Disciplina VALUES (3, 'Química', to_timestamp('10:30:00 AM', 'HH:MI:SS AM'), 4, 'Laboratório 5', '21334355676');

INSERT INTO Conteudo VALUES (1, 'A Lei dos grandes numeros', 'A Lei dos Grandes Números versa que a média aritmética dos resultados da realização da mesma experiência repetidas vezes tende a se aproximar do valor esperado à medida que mais tentativas se sucederem.', 1);
INSERT INTO Conteudo VALUES (2, 'Leis de Newton', 'As Leis de Newton descrevem o movimento de objetos e são fundamentais para a mecânica clássica.', 2);
INSERT INTO Conteudo VALUES (3, 'Reações Químicas', 'Reações químicas envolvem a transformação de substâncias, com a quebra e formação de ligações químicas.', 3);

SELECT di.Nome AS Disciplina, co.Titulo AS Conteudo
FROM Disciplina di JOIN Conteudo co 
ON di.Id = co.DisciplinaId
ORDER BY di.Nome, co.Titulo;

SELECT cu.Codigo AS Curso, COUNT(al.Matricula) AS Total_Feminino
FROM Aluno al JOIN Usuario us
ON al.UsuarioId = us.Id
JOIN AlunoCurso ac 
ON al.Matricula = ac.MatriculaAluno
JOIN Curso cu
ON ac.CodigoCurso = cu.Codigo 
WHERE us.Genero = 'F'
GROUP BY cu.Codigo;

SELECT pr.Identificacao AS Professor, di.nome AS Disciplinas, di.local 
FROM Professor pr JOIN Disciplina di 
ON pr.Identificacao = di.IdentificacaoProfessor
WHERE di.local = 'Sala 204';
