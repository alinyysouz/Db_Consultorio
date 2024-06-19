
create database db_Consultorio;

use db_Consultorio;

create table tb_Paciente(
id_Paciente int not null auto_increment,
Nome_Paciente varchar (100) not null,
Data_Nascimento_Paciente date not null,
Genero_Paciente enum ('m', 'f', 'nao-binamrio', 'trans'),
Cpf_Paciente varchar (14),
constraint pk_id_Paciente primary key (id_Paciente)
);

insert into tb_Paciente 
(Nome_Paciente, Data_Nascimento_Paciente, Genero_Paciente, Cpf_Paciente) values 
('Roberto Carlos','1941-04-19','m', '999.999.999-99'),
('Beyonce  Giselle ', '1981-09-04', 'f', '555.555.555-55'),
('Robyn Rihanna Fenty ', '1988-02-20', 'm', '444.444.444-44'),
('Shaffer Chimere Smith', '1979-10-18', 'm', '888.888.888-88');


select * from tb_Paciente;

create  table tb_Medico(
id_Medico int not null auto_increment,
Nome_Medico varchar (100) not null,
Data_Nascimento_Medico date not null,
Crm_Medico varchar (13) not null,
Genero_Medico enum ('m','f','nao-binario','trans'),
Cpf_Medico varchar (14) not null, 
Especialidade_Medico varchar (30) not null,
Turno_Medico enum ('manha','tarde','noite','madrugada') not null,
Contato_Medico varchar (15) not null,
constraint pk_id_Medico primary key (id_Medico)
);

drop table tb_Medico;


insert into tb_Medico (Nome_Medico, Data_Nascimento_Medico, Crm_Medico, Genero_Medico, Cpf_Medico, Especialidade_Medico, Turno_Medico, Contato_Medico) values 
('Alicia Rodrigues','1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Ginecologista', 'manha','(11)94988-8989'),
('Francisco Dantas ', '1975-11-21','CRM/SP 777777','m', '222.222.222-22', 'Fisioterapeuta','noite','(11)55555555'),
('Robyn Rihanna Fenty ','1941-04-20','CRM/SP 666666','f', '999.999.999-99', 'Cirurgião','madrugada','(11)977777777'),
('Shaffer Chimere Smith', '1941-04-20','CRM/SP 888888','m', '999.999.999-99', 'Dentista','madrugada','(11)977778877'),
('Beyoncé Giselle Knowles-Carter', '1899-03-25','CRM/RS 444444', 'f','232.232.232-89','Enfermeira', 'madrugada','(11)977722777');


create table tb_Consulta(
id_Consulta int not null auto_increment,
Data_Consulta date not null,
Hora_Consulta time not null,
fk_id_Paciente int not null,
fk_id_Medico int not null,
constraint pk_id_Consulta primary key (id_Consulta),

constraint fk_id_Medico foreign key (fk_id_Medico)
references tb_Medico (id_Medico),

constraint fk_id_Paciente foreign key (fk_id_Paciente)
references tb_Paciente (id_Paciente)
);

drop table tb_Consulta;

describe tb_Consulta;

alter table tb_Paciente
add column Convenio varchar(50);

describe tb_Paciente;

select Nome_Paciente, Genero_Paciente from tb_Paciente;

use db_Consultorio;

insert into tb_Consulta (Hora_Consulta, Data_Consulta, fk_id_Paciente, fk_id_Medico) values
('15:30', '2024-05-15', '1','1'),
('11:30', '2024-06-12','2','2'),
('11:30', '2024-06-12','3','3'),
('11:30', '2024-06-12','2','1');

/* os apelidos são rgistrados através de clausulas AS que tb podem ser chamadas de ALIAS */

select * from tb_Consulta as c
join tb_Paciente as p 
on c.id_Consulta = p.id_Paciente;

select c.Data_Consulta, p.Nome_Paciente from tb_Consulta as c
join tb_Paciente as p 
on c.id_Consulta = p.id_Paciente;

/*usando o INNER JOIN */

select * from tb_Consulta as c 
join tb_Paciente as p
on c.id_Consulta = p.id_Paciente
join tb_Medico as m 
on c.id_Consulta = m.id_Medico;

select c.Data_Consulta, p.Nome_Paciente, m.Nome_Medico from tb_Consulta as c 
join tb_Paciente as p
on c.id_Consulta = p.id_Paciente
join tb_Medico as m 
on c.id_Consulta = m.id_Medico
order by p.Nome_Paciente; /* ordem alfabética */

select * from tb_Consulta;

delete from tb_Consulta
where fk_id_Medico = '1';

use db_consultorio;


















