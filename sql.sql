CREATE TABLE tb_usuario (
	id_usuario SERIAL PRIMARY KEY,
	login_usuario VARCHAR(50),
	senha_usuario VARCHAR(50),
	nome_usuario VARCHAR(100)
);

INSERT INTO tb_usuario (login_usuario, senha_usuario, nome_usuario) VALUES ('renata', '123', 'Renata Soares Pereira'),
	('joao', '123', 'João'),
	('maria', '123', 'Maria');

ALTER TABLE tb_usuario ADD UNIQUE (login_usuario);

set sql_safe_updates = 0; //para deixar fazer o update no mysql//

UPDATE tb_usuario SET senha_usuario = '202cb962ac59075b964b07152d234b70';

CREATE TABLE tb_cliente (
	id_cliente SERIAL PRIMARY KEY,
	cpf_cliente CHAR(11),
	nome_cliente VARCHAR(100),
	email_cliente VARCHAR(100),
	data_cliente DATE,
	rua_cliente VARCHAR(100),
	nr_cliente INT,
	cep_cliente CHAR(8)
);

insert into tb_cliente (cpf_cliente, nome_cliente, email_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente) values 
	('24434639180', 'Korrie Bann', 'kbann0@shareasale.com', '2018-01-20', 'Oak', 612, '4313746'),
	('70227444200', 'Dirk Scrivens', 'dscrivens1@dmoz.org', '2018-09-04', 'Knutson', 0, '16556860'),
	('10275062030', 'Deb cornhill', 'dcornhill2@patch.com', '2017-12-02', 'Arizona', 6, '60600430'),
	('64730768210', 'Gail Pigny', 'gpigny3@feedburner.com', '2018-09-12', 'Evergreen', 64, '98170270'),
	('29342141200', 'Delcina Lichfield', 'dlichfield4@so-net.ne.jp', '2018-07-31', 'Anthes', 0, '13469340'),
	('48062003970', 'Tasia Sandle', 'tsandle5@pbs.org', '2018-09-23', 'Hauk', 790, '9108690'),
	('42277861180', 'Alaine D''Antuoni', 'adantuoni6@blogspot.com', '2017-12-29', 'Northridge', 43899, '73097660'),
	('73586468610', 'Dominik Rosoman', 'drosoman7@symantec.com', '2018-05-21', 'Montana', 01255, '11147900'),
	('98424508020', 'Cole Mistry', 'cmistry8@lycos.com', '2018-05-12', 'Helena', 7712, '94925300'),
	('21882491700', 'Vivyan Oldfield-Cherry', 'voldfieldcherry9@pbs.org', '2018-04-27', 'Nancy', 53317, '50470035');

ALTER TABLE tb_cliente ADD UNIQUE (cpf_cliente);
ALTER TABLE tb_cliente ADD UNIQUE (email_cliente);
												 
CREATE TABLE tb_estado (
	id_estado INT AUTO_INCREMENT,
	nome_estado VARCHAR(100),
	sigla_estado CHAR(2),
	
	PRIMARY KEY (id_estado)
);
												   
CREATE TABLE tb_cidade (
	id_cidade INT AUTO_INCREMENT,
	nome_cidade VARCHAR(100),
	id_estado INTEGER,
	
	PRIMARY KEY (id_cidade),
	FOREIGN KEY (id_estado) REFERENCES tb_estado (id_estado)
);

INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Acre', 'AC');  
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Alagoas', 'AL');  
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Amazonas', 'AM');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Amapá', 'AP');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Bahia', 'BA');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Ceará', 'CE');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Distrito Federal', 'DF');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Espírito Santo', 'ES');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Goiás', 'GO');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Maranhão', 'MA');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Minas Gerais', 'MG');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Mato Grosso do Sul', 'MS');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Mato Grosso', 'MT');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Pará', 'PA');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Paraíba', 'PB');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Pernambuco', 'PE');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Piauí','PI');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Paraná', 'PR');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Rio de Janeiro', 'RJ');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Rio Grande do Norte', 'RN');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Rondônia', 'RO');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Roraima', 'RR');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Rio Grande do Sul', 'RS');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Santa Catarina', 'SC');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Sergipe', 'SE');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('São Paulo', 'SP');
INSERT INTO tb_estado (nome_estado, sigla_estado) VALUES ('Tocantins', 'TO');


INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acrelândia', 1);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Assis Brasil', 1);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Brasiléia', 1);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Bujari', 1);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Capixaba', 1);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Cruzeiro do Sul', 1);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Epitaciolândia', 1);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Feijó', 1);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Jordão', 1);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Mâncio Lima', 1);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Branca', 2);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Anadia', 2);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Arapiraca', 2);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Atalaia', 2);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Barra de Santo Antônio', 2);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Barra de São Miguel', 2);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Batalha', 2);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Belém', 2);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Belo Monte', 2);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Boca da Mata', 2);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alvarães', 3);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amaturá', 3);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Anamã', 3);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Anori', 3);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Apuí', 3);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Atalaia do Norte', 3);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Autazes', 3);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Barcelos', 3);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Barreirinha', 3);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Benjamin Constant', 3);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Serra do Navio', 4);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amapá', 4);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Pedra Branca do Amapari', 4);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Calçoene', 4);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Cutias', 4);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Ferreira Gomes', 4);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Itaubal', 4);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Laranjal do Jari', 4);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Macapá', 4);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Mazagão', 4);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abaíra', 5);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abaré', 5);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acajutiba', 5);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Adustina', 5);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Fria', 5);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Érico Cardoso', 5);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aiquara', 5);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alagoinhas', 5);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alcobaça', 5);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Almadina', 5);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abaiara', 6);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acarape', 6);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acaraú', 6);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acopiara', 6);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aiuaba', 6);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alcântaras', 6);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Altaneira', 6);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Santo', 6);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amontada', 6);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Antonina do Norte', 6);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Brasília', 7);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Afonso Cláudio', 8);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águia Branca', 8);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Doce do Norte', 8);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alegre', 8);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alfredo Chaves', 8);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Rio Novo', 8);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Anchieta', 8);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Apiacá', 8);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aracruz', 8);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Atilio Vivacqua', 8);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abadia de Goiás', 9);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abadiânia', 9);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acreúna', 9);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Adelândia', 9);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Fria de Goiás', 9);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Limpa', 9);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas Lindas de Goiás', 9);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alexânia', 9);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aloândia', 9);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Horizonte', 9);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Açailândia', 10);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Afonso Cunha', 10);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Doce do Maranhão', 10);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alcântara', 10);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aldeias Altas', 10);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Altamira do Maranhão', 10);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Alegre do Maranhão', 10);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Alegre do Pindaré', 10);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Parnaíba', 10);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amapá do Maranhão', 10);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abadia dos Dourados', 11);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abaeté', 11);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abre Campo', 11);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acaiaca', 11);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Açucena', 11);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Boa', 11);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Comprida', 11);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aguanil', 11);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas Formosas', 11);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas Vermelhas', 11);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Clara', 12);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alcinópolis', 12);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amambai', 12);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Anastácio', 12);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Anaurilândia', 12);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Angélica', 12);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Antônio João', 12);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aparecida do Taboado', 12);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aquidauana', 12);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aral Moreira', 12);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acorizal', 13);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Boa', 13);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alta Floresta', 13);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Araguaia', 13);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Boa Vista', 13);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Garças', 13);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Paraguai', 13);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Taquari', 13);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Apiacás', 13);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Araguaiana', 13);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abaetetuba', 14);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abel Figueiredo', 14);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acará', 14);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Afuá', 14);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Azul do Norte', 14);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alenquer', 14);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Almeirim', 14);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Altamira', 14);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Anajás', 14);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Ananindeua', 14);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Branca', 15);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aguiar', 15);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alagoa Grande', 15);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alagoa Nova', 15);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alagoinha', 15);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alcantil', 15);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Algodão de Jandaíra', 15);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alhandra', 15);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('São João do Rio do Peixe', 15);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amparo', 15);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abreu e Lima', 16);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Afogados da Ingazeira', 16);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Afrânio', 16);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Agrestina', 16);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Preta', 16);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas Belas', 16);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alagoinha', 16);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aliança', 16);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Altinho', 16);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amaraji', 16);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acauã', 17);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Agricolândia', 17);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Branca', 17);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alagoinha do Piauí', 17);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alegrete do Piauí', 17);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Longá', 17);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Altos', 17);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alvorada do Gurguéia', 17);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amarante', 17);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Angical do Piauí', 17);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abatiá', 18);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Adrianópolis', 18);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Agudos do Sul', 18);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Almirante Tamandaré', 18);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Altamira do Paraná', 18);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Altônia', 18);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Paraná', 18);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Piquiri', 18);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alvorada do Sul', 18);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amaporã', 18);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Angra dos Reis', 19);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aperibé', 19);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Araruama', 19);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Areal', 19);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Armação dos Búzios', 19);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Arraial do Cabo', 19);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Barra do Piraí', 19);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Barra Mansa', 19);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Belford Roxo', 19);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Bom Jardim', 19);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Acari', 20);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Açu', 20);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Afonso Bezerra', 20);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Nova', 20);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alexandria', 20);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Almino Afonso', 20);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto do Rodrigues', 20);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Angicos', 20);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Antônio Martins', 20);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Apodi', 20);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alta Floresta D''Oeste', 21);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Ariquemes', 21);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Cabixi', 21);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Cacoal', 21);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Cerejeiras', 21);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Colorado do Oeste', 21);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Corumbiara', 21);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Costa Marques', 21);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Espigão D''Oeste', 21);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Guajará-Mirim', 21);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amajari', 22);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Alegre', 22);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Boa Vista', 22);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Bonfim', 22);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Cantá', 22);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Caracaraí', 22);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Caroebe', 22);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Iracema', 22);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Mucajaí', 22);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Normandia', 22);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aceguá', 23);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Santa', 23);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Agudo', 23);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Ajuricaba', 23);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alecrim', 23);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alegrete', 23);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alegria', 23);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Almirante Tamandaré do Sul', 23);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alpestre', 23);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Alegre', 23);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abdon Batista', 24);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abelardo Luz', 24);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Agrolândia', 24);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Agronômica', 24);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Água Doce', 24);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas de Chapecó', 24);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas Frias', 24);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas Mornas', 24);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alfredo Wagner', 24);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alto Bela Vista', 24);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Amparo de São Francisco', 25);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aquidabã', 25);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aracaju', 25);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Arauá', 25);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Areia Branca', 25);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Barra dos Coqueiros', 25);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Boquim', 25);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Brejo Grande', 25);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Campo do Brito', 25);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Canhoba', 25);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Adamantina', 26);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Adolfo', 26);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aguaí', 26);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas da Prata', 26);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas de Lindóia', 26);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas de Santa Bárbara', 26);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Águas de São Pedro', 26);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Agudos', 26);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alambari', 26);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alfredo Marcondes', 26);

INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Abreulândia', 27);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aguiarnópolis', 27);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aliança do Tocantins', 27);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Almas', 27);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Alvorada', 27);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Ananás', 27);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Angico', 27);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aparecida do Rio Negro', 27);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Aragominas', 27);
INSERT INTO tb_cidade (nome_cidade, id_estado) values ('Araguacema', 27);

ALTER TABLE tb_cliente ADD COLUMN id_cidade INTEGER;
ALTER TABLE tb_cliente ADD FOREIGN KEY (id_cidade) REFERENCES tb_cidade(id_cidade);

update tb_cliente set id_cidade = 155; // colocando cidade na tabela cliente no mysql


//o comando abaixo coloca cidade randomincamente na tabela cliente no postgresql:

DO $$
DECLARE
rec record;
BEGIN
   FOR rec IN SELECT id_cliente 
        FROM tb_cliente
   LOOP 
		UPDATE tb_cliente SET id_cidade = (SELECT random()*(261)+1) WHERE id_cliente = rec.id_cliente;
   END LOOP;
END; $$


CREATE TABLE tb_produto (
	id_produto SERIAL PRIMARY KEY,
	nome_produto VARCHAR(100)
);

CREATE TABLE tb_tipo_atendimento (
	id_tipo_atendimento SERIAL PRIMARY KEY,
	nome_tipo_atendimento VARCHAR(50)
);

CREATE TABLE tb_atendimento (
	id_atendimento SERIAL PRIMARY KEY,
	dt_hr_atendimento DATE,
	dsc_atendimento VARCHAR(255),
	id_produto INTEGER,
	id_tipo_atendimento INTEGER,
	id_usuario INTEGER,
	id_cliente INTEGER,
	res_atendimento CHAR(1),
	
	FOREIGN KEY (id_produto) REFERENCES tb_produto (id_produto),
	FOREIGN KEY (id_tipo_atendimento) REFERENCES tb_tipo_atendimento (id_tipo_atendimento),
	FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario),
	FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id_cliente)
);

ALTER TABLE tb_atendimento DROP COLUMN dt_hr_atendimento;
ALTER TABLE tb_atendimento ADD COLUMN dt_hr_atendimento TIMESTAMP;


INSERT INTO tb_produto (nome_produto) values ('Conversor USB para Serial');
INSERT INTO tb_produto (nome_produto) values ('SSD 120GB Sandisk SSD Plus 310MB/530MB/s 20X');
INSERT INTO tb_produto (nome_produto) values ('Fonte ATX 350W reais C3Tech PS-350 24 pinos c/ chave');
INSERT INTO tb_produto (nome_produto) values ('Teclado e mouse com fio Logitech Desktop MK120');
INSERT INTO tb_produto (nome_produto) values ('Conversor USB para Serial');
INSERT INTO tb_produto (nome_produto) values ('Bateria chumbo-acido Unipower UP1270E, 12V, 7Ah, F187');
INSERT INTO tb_produto (nome_produto) values ('Álcool isopropílico puro, Isopropanol Implastec, 110ml');
INSERT INTO tb_produto (nome_produto) values ('Placa de rede D-Link DGE-528T GigaExpress 10/100/1000Mb');
INSERT INTO tb_produto (nome_produto) values ('Adaptador de vídeo HDMI p/ VGA Plus Cable ADP-002');
INSERT INTO tb_produto (nome_produto) values ('Pasta térmica p/ componentes eletrônicos Implastec 10 g');

INSERT INTO tb_tipo_atendimento (nome_tipo_atendimento) values ('Manutenção de hardware');
INSERT INTO tb_tipo_atendimento (nome_tipo_atendimento) values ('Troca/instalação de hardware');
INSERT INTO tb_tipo_atendimento (nome_tipo_atendimento) values ('Limpeza de hardware');
INSERT INTO tb_tipo_atendimento (nome_tipo_atendimento) values ('Instalação de software');


