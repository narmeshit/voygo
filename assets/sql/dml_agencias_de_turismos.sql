/*
-Instituto: "IESTP Jose María Arguedas - Puquio"-
--Unidad Didáctica: Herramientas de desarrollo de Software--
--Unidad Didáctica: Análisis y Diseño de Sistemas--
--Docente: Ing Jhon David Ccoyllo Rojas--
--Perido académico: IV--
--Programa de estudio: APSTI--
---Fecha entrega: 13/11/2024---

Base de datos: bd_agencias_de_turismos
Descripcion: 
Integrantes:
-
-
-
-
-

Subconjunto del lenguaje SQL: DML
*/

INSERT INTO module(name, icon, state)
VALUES
('Destinos', 'travel_explore', 0),
('Reservas', 'event', 0),
('Mis Viajes', 'assignment', 1),
('Favoritos', 'favorite', 0),
('Historial de Reservas', 'history', 1),
('Explorar Tours', 'hiking', 0),
('Pagos y Métodos', 'credit_card', 1),
('Promociones', 'local_offer', 1),
('Soporte', 'support_agent', 1),
('Buscar', 'search', 1),
('Notificaciones', 'notifications', 1);

INSERT INTO category(id, name)
VALUES
(1,'Playas'),
(2,'Montañas'),
(3,'Selva'),
(4,'Ciudades principales'),
(5,'Pueblos mágicos');

INSERT INTO agency(ruc, company_name, services, description, location, category_id)
VALUES
('20100045212', 'Nuevo Mundo Viajes SAC', 'Paquetes turísticos • Venta de boletos • Asesoría personalizada', 'Nuevo Mundo Viajes ofrece una experiencia de viaje personalizada, adaptándose a las necesidades de sus clientes con más de 20 años en el mercado.', 'Miraflores, Lima', 1),
('20100221691', 'Lima Tours SA', 'Tours culturales • Paquetes temáticos • Organización de eventos', 'Fundada en 1956, esta agencia se especializa en crear experiencias únicas, priorizando la calidad y la innovación en sus servicios.', 'Miraflores, Lima', 1),
('20100045291', 'Condor Travel S.A.', 'Excursiones • Tours personalizados • Actividades de aventura', 'Líder en el turismo receptivo en Cusco, Condor Travel combina años de experiencia con una pasión por mostrar lo mejor de Perú.', 'Cusco', 1),
('20400912895', 'Arequipa Tours SAC', 'Tours al Cañón del Colca • Excursiones culturales • Reservas', 'Agencia reconocida por sus paquetes a medida para explorar la "Ciudad Blanca" y sus alrededores.', 'Arequipa', 1),
('20450874567', 'Viajes Ayacucho SAC', 'Paquetes turísticos • Traslados • Excursiones personalizadas', 'Agencia local con enfoque en el turismo regional, promoviendo la cultura ayacuchana.', 'Ayacucho', 1),
('20295841326', 'Horizonte Ayacucho Travel EIRL', 'Tours a destinos cercanos • Machu Picchu • Agendamiento', 'Especializada en turismo cultural y naturaleza en Ayacucho y otras ciudades cercanas.', 'Ayacucho', 1),
('20358290456', 'Colca Canyon Travel SAC', 'Tours al Cañón del Colca • Observación de cóndores • Paquetes turísticos', 'Agencia enfocada en el ecoturismo y las rutas de aventura en la región sur del Perú.', 'Arequipa', 2),
('20400937280', 'Trujillo Travel SAC', 'Recorridos por las Huacas del Sol y la Luna • Tours a Chan Chan y Huanchaco', 'Especialista en turismo arqueológico con guías expertos en la cultura Moche.', 'Trujillo', 2),
('20450110937', 'Chan Chan Tours E.I.R.L.', 'Excursiones guiadas a Chan Chan • Paquetes turísticos', 'Ofrecen recorridos detallados sobre las civilizaciones precolombinas del norte.', 'Trujillo', 2),
('20394812045', 'Puno Tours and Travel EIRL', 'Tours al Lago Titicaca • Excursiones a islas flotantes y comunidades locales', 'Agencia especializada en turismo de aventura y cultural en la región de Puno.', 'Puno', 2),
('20348792671', 'Peruvian Andes Travel', 'Trekking por el Camino Inca • Tours guiados a Machu Picchu', 'Especialista en turismo de aventura y rutas de trekking por los Andes.', 'Cusco', 2),
('20415063845', 'Amazon Experience Travel', 'Tours por la selva amazónica • Programas de ecoturismo • Avistamiento de fauna', 'Agencia dedicada a promover el ecoturismo en la selva peruana.', 'Iquitos', 3),
('20452387624', 'Latam Travel Perú', 'Vuelos nacionales e internacionales • Paquetes turísticos', 'Filial de la conocida aerolínea LATAM, ofrece paquetes turísticos completos.', 'Lima', 3),
('20345698734', 'Viajes Rosario Perú SAC', 'Paquetes de viajes • Asesoría para viajes', 'Agencia con años de experiencia ofreciendo asesoría en viajes turísticos y familiares.', 'Lima', 3),
('20450128790', 'Orion Viajes SAC', 'Organización de eventos • Turismo receptivo', 'Agencia con un enfoque en el servicio personalizado, tanto en turismo corporativo como familiar.', 'Lima', 3),
('20423865012', 'Tierras Incaicas Travel', 'Excursiones al Valle Sagrado • Paquetes de lujo a Machu Picchu', 'Se especializa en turismo cultural de lujo y servicios exclusivos para viajeros exigentes.', 'Cusco', 3),
('20350489217', 'Inca Trail Peru E.I.R.L.', 'Excursiones y trekking • Actividades personalizadas • tours guiados', 'Focalizada en turismo de aventura, especialmente en el Camino Inca y sus alrededores.', 'Cusco', 3),
('20394018216', 'Peruvian Nature Expeditions', 'Expediciones de trekking • Servicios en ecoturismo', 'Agencia dedicada a la exploración de la naturaleza peruana a través de rutas de trekking.', 'Arequipa', 4),
('20348210765', 'Perú Verde Travel', 'Tours por la selva y la cordillera de los Andes • Servicios de transporte', 'Especializada en el ecoturismo, con un enfoque en experiencias únicas en la naturaleza.', 'Lima', 4),
('20450189756', 'Viajar Perú', 'Paquetes turísticos a Arequipa y el Cañón del Colca • Tours a las Islas Ballestas', 'Agencia enfocada en promover el turismo ecológico y cultural en Arequipa.', 'Arequipa', 4),
('20450964233', 'Inca Rail', 'Servicios de tren a Machu Picchu • Excursiones guiadas', 'Empresa de transporte ferroviario que conecta Cusco con Machu Picchu, con servicios exclusivos.', 'Cusco', 4),
('20345602177', 'Amazonas Explorer', 'Tours por la selva amazónica • Programas de ecoturismo • Observación de fauna', 'Agencia especializada en viajes de aventura por la Amazonía peruana.', 'Iquitos', 4),
('20394028218', 'Explorer Perú', 'Paquetes turísticos personalizados • Servicios de guía y transporte privado', 'Enfocada en ofrecer experiencias únicas en diversas regiones del Perú.', 'Lima', 4),
('20352218079', 'Peru Expedition', 'Tours guiados a Machu Picchu • Trekking por la ruta Salkantay y el Camino Inca', 'Especialista en rutas de trekking, enfocada en el turismo de aventura.', 'Cusco', 5),
('20450983360', 'Golden Peru Tours', 'Tours privados • Transporte exclusivo • Alojamiento de lujo', 'Agencia que se distingue por ofrecer servicios de lujo en el turismo nacional.', 'Lima', 5),
('20352230991', 'Machu Picchu Travel', 'Paquetes completos a Machu Picchu • Transporte • Alojamiento exclusivos', 'Agencia especializada en tours exclusivos para Machu Picchu, con servicios personalizados.', 'Lima', 5),
('20398215065', 'Peruvian Andes Travel', 'Paquetes a destinos culturales • Excursiones personalizadas', 'Agencia dedicada al turismo cultural, con énfasis en las tradiciones andinas.', 'Lima', 5),
('20354262819', 'Patagonia Perú Tours', 'Tours por la cordillera de los Andes • Expediciones a la Patagonia peruana', 'Agencia especializada en el turismo de aventura, con rutas exclusivas por la región.', 'Lima', 5),
('20450176400', 'Andean Travel Peru', 'Tours guiados • Trekking • Actividades al aire libre', 'Enfocada en el ecoturismo, ofreciendo experiencias inolvidables en la región andina.', 'Cusco', 1),
('20348792654', 'Tucano Travel', 'Excursiones a la selva amazónica • Paquetes de turismo de aventura', 'Especializada en ecoturismo en la Amazonía peruana, promoviendo la conservación y el disfrute de la fauna.', 'Iquitos', 2),
('20392883704', 'Viaje Peruano', 'Paquetes nacionales e internacionales • Servicios de guía y traslados', 'Agencia que ofrece tours completos y paquetes personalizados a destinos dentro y fuera de Perú.', 'Lima', 2),
('20354102819', 'Sacred Valley Expeditions', 'Tours en el Valle Sagrado de los Incas • Excursiones de trekking y actividades culturales', 'Agencia enfocada en ofrecer experiencias auténticas en el Valle Sagrado.', 'Cusco', 3),
('20391263578', 'Puno Eco Tours', 'Excursiones a las Islas del Lago Titicaca • Tours de ecoturismo y actividades comunitarias', 'Agencia especializada en promover el ecoturismo en el altiplano peruano.', 'Puno', 3),
('20392457236', 'Sacred Treks Peru', 'Excursiones de trekking por los Andes • Tours personalizados', 'Agencia dedicada a ofrecer experiencias exclusivas de trekking y aventura en la región.', 'Cusco', 4),
('20348798216', 'Inca World Travel', 'Paquetes turísticos • Transporte y alojamiento exclusivos', 'Ofrecen tours especializados en las maravillas arqueológicas de Perú.', 'Lima', 5),
('20457201235', 'Perú Expeditions', 'Tours guiados • Trekking y caminatas guiadas', 'Agencia enfocada en aventuras al aire libre y experiencias culturales en Perú.', 'Lima', 5);
