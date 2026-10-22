use multiLinguas;

/*
create table escola (
    id_escola int auto_increment primary key,
    nome_instituicao varchar(150) not null,
    cnpj varchar(18) not null unique,
    email_contato varchar(100) not null,
    data_cadastro timestamp default current_timestamp
);

create table turma (
    id_turma int auto_increment primary key,
    id_escola int not null,
    nome_turma varchar(100) not null,
    ano_letivo int not null,
    foreign key (id_escola) references escola(id_escola)
);

create table usuario (
    id_usuario int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    senha_hash varchar(255) not null,
    data_nascimento date not null,
    faixa_etaria enum('8_14', '15_17', 'adulto') not null,
    tipo_perfil enum('aluno', 'professor', 'admin') not null default 'aluno',
    id_turma int,
    data_cadastro timestamp default current_timestamp,
    foreign key (id_turma) references turma(id_turma)
);

create table perfil_estudante (
    id_perfil int auto_increment primary key,
    id_usuario int not null unique,
    idioma_nativo varchar(10) not null,
    idioma_estudo varchar(10) not null,
    estilo_vocabulario enum('formal', 'academico', 'simples') default 'simples',
    modulos_concluidos_acumulados int default 0,
    nivel_fluencia_atual varchar(20) default 'iniciante',
    foreign key (id_usuario) references usuario(id_usuario)
);

create table assinatura_vip (
    id_assinatura int auto_increment primary key,
    id_usuario int not null,
    tipo_plano enum('gratuito', 'vip') default 'gratuito',
    status enum('ativa', 'cancelada', 'expirada', 'pendente') default 'pendente',
    cota_semanal_traducoes int default 20,
    traducoes_usadas_semana int default 0,
    data_inicio datetime default now(),
    data_expiracao datetime,
    foreign key (id_usuario) references usuario(id_usuario)
);

create table sala_chat (
    id_sala int auto_increment primary key,
    id_usuario_1 int not null,
    id_usuario_2 int not null,
    autorizado_por_responsavel boolean default false,
    data_criacao timestamp default current_timestamp,
    foreign key (id_usuario_1) references usuario(id_usuario),
    foreign key (id_usuario_2) references usuario(id_usuario)
);

create table mensagem_chat (
    id_mensagem int auto_increment primary key,
    id_sala int not null,
    id_emissor int not null,
    texto_original text not null,
    texto_traduzido text,
    idioma_origem varchar(10) not null,
    idioma_destino varchar(10) not null,
    contem_conteudo_inapropriado boolean default false,
    data_envio timestamp default current_timestamp,
    foreign key (id_sala) references sala_chat(id_sala),
    foreign key (id_emissor) references usuario(id_usuario)
);

create table avaliacao_nivel (
    id_avaliacao int auto_increment primary key,
    id_usuario int not null,
    pontuacao_obtida decimal(5,2) not null,
    nivel_resultante varchar(20) not null,
    eh_reavaliacao_obrigatoria boolean default false,
    data_realizacao timestamp default current_timestamp,
    foreign key (id_usuario) references usuario(id_usuario)
);

create table progresso_aprendizado (
    id_progresso int auto_increment primary key,
    id_usuario int not null,
    modulo_id int not null,
    minutos_praticados int default 0,
    licoes_concluidas int default 0,
    data_registro date not null,
    foreign key (id_usuario) references usuario(id_usuario)
);

create table recomendacao_vocabulario (
    id_recomendacao int auto_increment primary key,
    id_usuario int not null,
    palavra_expressao varchar(100) not null,
    traducao varchar(100) not null,
    frequencia_uso int default 1,
    sugerida_por_nlp boolean default false,
    data_ultima_ocorrencia timestamp default current_timestamp,
    foreign key (id_usuario) references usuario(id_usuario)
);

create table reporte_falha_traducao (
    id_reporte int auto_increment primary key,
    id_usuario int not null,
    texto_original text not null,
    traducao_incorreta text not null,
    correcao_sugerida text,
    data_reporte timestamp default current_timestamp,
    foreign key (id_usuario) references usuario(id_usuario)
);
*/

select * from usuario;
select id_usuario, nome, email from usuario;

insert into progresso_aprendizado (id_usuario, modulo_id, minutos_praticados, licoes_concluidas, data_registro)
values (1, 101, 25, 2, curdate());

insert into progresso_aprendizado (id_usuario, modulo_id, minutos_praticados, licoes_concluidas, data_registro)
values 
  (2, 101, 30, 3, curdate()),
  (3, 102, 45, 5, date_sub(curdate(), interval 1 day)),
  (4, 103, 20, 2, date_sub(curdate(), interval 2 day));

select * from progresso_aprendizado;
delete from progresso_aprendizado where id_progresso = 2;

/* apagar todos os registros (escolha a tabela) */
truncate table progresso_aprendizado;