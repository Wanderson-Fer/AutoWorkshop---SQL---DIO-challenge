-- sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica
-- drop database autoworkshop;  -- Reset

create database autoworkshop;
use autoworkshop;

-- Tabela de Clientes
create table clients (
	IdClient int auto_increment primary key,
    PName varchar(15) not null,
    MInit varchar(3) not null,
    LName varchar(20) not null,
    Address varchar(255),
    PhoneNumber char(11)
);
alter table clients auto_increment = 1;

-- Tabela de Veículos
create table vehicle (
	IdVehicle int auto_increment primary key,
    IdClient int not null,
    Color varchar(10),
    Brand varchar(15),
    Model varchar(25),
    YearModel char(4),
    Plate char(7),
    constraint fk_vehicle_client
		foreign key (IdClient) references clients(IdClient)
);
alter table vehicle auto_increment = 1;

-- Tabela do Time de mecânicos
create table mechanicTeam (
	IdMechanicTeam int auto_increment primary key,
    TeamName varchar(25) not null,
    constraint unique_mechanicTeam_TeamName
		unique(TeamName)
);
alter table mechanicTeam auto_increment = 1;

-- Tabela de Mecânicos
create table mechanic (
	IdMechanic int auto_increment primary key,
    IdMechanicTeam int,
	PName varchar(15) not null,
    MInit varchar(3) not null,
    LName varchar(20) not null,
	Address varchar(255) not null,
    Specialty varchar(20),
    constraint fk_mechanic_mechanicTeam
		foreign key (IdMechanicTeam) references mechanicTeam(IdMechanicTeam)
);
alter table mechanic auto_increment = 1;

-- Tabela de serviços
-- A tabela de Mão-de-obra ficou com significado ambíguo, uma vez que paracia não ter relação direta com o serviço
create table service (
	IdService int auto_increment primary key,
    ServiceDescription varchar(255) not null,
    Price float not null
);
alter table service auto_increment = 1;

-- Tabela de peças
create table part (
	IdPart int auto_increment primary key,
    PartDescription varchar(255) not null,
    Price float not null
);
alter table part auto_increment = 1;

-- Tabela de Ordem de serviços
create table orders (
	IdOrder int auto_increment primary key,
    IdVehicle int,
    IdMechanicTeam int,
    IssueDate date not null,
    DeliveryDate date not null,
    ServiceOrderStatus enum('Agendado', 'Em Progresso', 'Concluído', 'Cancelado') default 'Agendado',
    Amount float,
    constraint fk_serviceOrder_vehicle
		foreign key (IdVehicle) references vehicle(IdVehicle),
    constraint fk_serviceOrder_mechanic
		foreign key (IdMechanicTeam) references mechanicTeam(IdMechanicTeam)
);
alter table orders auto_increment = 1;

-- Tabela da relação entre Ordem de serviços e peças
create table orderPart (
	IdOrder int,
    IdPart int,
    Quantity int default 1,
    primary key (IdOrder, IdPart),
    constraint fk_orderPart_orders
		foreign key (IdOrder) references orders(IdOrder),
	constraint fk_orderPart_part
		foreign key (IdPart) references part(IdPart)
);
alter table orderPart auto_increment = 1;

-- Tabela da relação entre Ordem de serviços e serviços
create table orderService (
	IdOrder int,
    IdService int,
    Quantity int default 1,
    primary key (IdOrder, IdService),
    constraint fk_orderService_orders
		foreign key (IdOrder) references orders(IdOrder),
	constraint fk_orderService_service
		foreign key (IdService) references service(IdService)
);
alter table orderService auto_increment = 1;
