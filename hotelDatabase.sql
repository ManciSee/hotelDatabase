-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Feb 23, 2022 alle 08:52
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelDatabase`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Dipartimenti`
--

CREATE TABLE `Dipartimenti` (
  `idDipartimento` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descrizione` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Dipartimenti`
--

INSERT INTO `Dipartimenti` (`idDipartimento`, `nome`, `descrizione`) VALUES
(1, 'Cucina', 'L’Hotel offre ai propri ospiti un servizio di cucina a colazione e a cena, per darvi le energie necessarie per affrontare al meglio la vostra permanenza. Il personale è a vostra disposizione per qualsiasi tipo di esigenza alimentare'),
(2, 'Palestra', 'L’Hotel con Palestra per un soggiorno senza rinunce.\r\nModerni e innovativi attrezzi e macchine isotoniche, insieme ai classici must dell’allenamento aerobico danno vita alla  palestra'),
(3, 'Spa', 'La nostra sta è stata progettata per regalarvi momenti di assoluto relax, in uno scenario unico, atmosfere tra acqua e luce.'),
(4, 'Discoteca', 'Locale privato esclusivo per i nostri clienti.\r\nAperto 3 sere a settimana, per dare la possibilità di godere del nostro intrattenimento ma anche delle piacevoli serate di animazione; spettacoli folkloristici, lotterie a premi, band per musica dal vivo, sala da ballo, bar.'),
(5, 'Hall', 'Locale più importante dellalbergo, ha il compito di ricevere gli ospiti.\r\nE presente un area di front-office con un bancone e una di back-office riservata al personale.'),
(6, 'Bar', 'L hotel dispone di un bar interno per offrire agli ospiti ogni tipo di caffetteria, spremute, tisane e long drink durante la giornata.'),
(7, 'Parcheggio', 'Tra posti coperti o scoperti, garage o aree all’aperto, il nostro hotel offre ai clienti la possibilità di ottenere un posto sicuro per parcheggiare la propria vettura.'),
(8, 'Casino', 'Moderna sala da gioco\r\n');

-- --------------------------------------------------------

--
-- Struttura della tabella `Hotel`
--

CREATE TABLE `Hotel` (
  `idHotel` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `numeroTelefono` varchar(12) NOT NULL,
  `email` varchar(30) NOT NULL,
  `descrizione` varchar(300) NOT NULL,
  `numeroPiani` int(11) NOT NULL,
  `numeroStanze` int(11) NOT NULL,
  `idIndirizzo` int(11) NOT NULL,
  `idRecensione` int(11) NOT NULL,
  `checkIn` time NOT NULL,
  `checkOut` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Hotel`
--

INSERT INTO `Hotel` (`idHotel`, `nome`, `numeroTelefono`, `email`, `descrizione`, `numeroPiani`, `numeroStanze`, `idIndirizzo`, `idRecensione`, `checkIn`, `checkOut`) VALUES
(1, 'Hotel Palace Milano', '123 4567789', 'hotel@palacemilano.it', 'L Hotel Palace è un moderno albergo 5 stelle situato a Milano, elegante e moderno, gli ambienti dell hotel sono nuovi, luminosi ed accoglienti.', 12, 63, 1, 1, '07:00:00', '23:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `Impiegati`
--

CREATE TABLE `Impiegati` (
  `idImpiegato` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `numeroTelefono` varchar(12) NOT NULL,
  `email` varchar(30) NOT NULL,
  `idHotel` int(11) NOT NULL,
  `idIndirizzo` int(11) NOT NULL,
  `idDipartimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Impiegati`
--

INSERT INTO `Impiegati` (`idImpiegato`, `nome`, `cognome`, `salario`, `numeroTelefono`, `email`, `idHotel`, `idIndirizzo`, `idDipartimento`) VALUES
(1, 'Mario', 'Rossi', '850.00', '455 2300076', 'mario@rossi.it', 1, 1, 4),
(2, 'Pippo', 'Verdi', '900.00', '231 4091134', 'pippo@verdi.it', 1, 1, 1),
(3, 'Tinuccia Maria', 'Modio', '1200.00', '845 6421340', 'tinuccia@modio.it', 1, 1, 5),
(4, 'Zannetto', 'Landro', '850.00', '122 4352230', 'zannetto@landro.it', 1, 1, 7),
(5, 'Maddalena', 'Pagnin', '1000.00', '092 8945502', 'maddalena@pagnin.it', 1, 1, 1),
(6, 'Esperio', 'Pittorru', '1200.00', '111 4390076', 'esperio@pittorru.it', 1, 1, 5),
(7, 'Santina ', 'Lo Chiano', '950.00', '345 0776501', 'santina@lochiaro.it', 1, 1, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `Indirizzi`
--

CREATE TABLE `Indirizzi` (
  `idIndirizzo` int(11) NOT NULL,
  `citta` varchar(30) NOT NULL,
  `via` varchar(30) NOT NULL,
  `cap` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Indirizzi`
--

INSERT INTO `Indirizzi` (`idIndirizzo`, `citta`, `via`, `cap`) VALUES
(1, 'Milano', 'corso Italia 127', '20122');

-- --------------------------------------------------------

--
-- Struttura della tabella `Ospiti`
--

CREATE TABLE `Ospiti` (
  `idOspite` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `numeroTelefono` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tipoPagamento` varchar(30) NOT NULL,
  `idIndirizzo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Ospiti`
--

INSERT INTO `Ospiti` (`idOspite`, `nome`, `cognome`, `numeroTelefono`, `email`, `tipoPagamento`, `idIndirizzo`) VALUES
(1, 'Ortesio', 'Del Din', '456 1009982', 'ortesio@deldin.it', 'contanti', 1),
(2, 'Romi', 'Pittorra', '343 987765', 'romi@pittorra.it', 'bancomat', 1),
(3, 'Luisita', 'Senape', '099 8129965', 'luisita@senape.it', 'carta di credito', 1),
(4, 'Ausonia', 'Legena', '234 9083646', 'ausonia@legena.it', 'contanti', 1),
(5, 'Evelisa', 'Oriolo', '986 2837752', 'evelisa@oriolo.it', 'bancomat', 1),
(6, 'Amabilio', 'Biondini', '345 0891123', 'amabilio@biondini.it', 'contanti', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Prenotazioni`
--

CREATE TABLE `Prenotazioni` (
  `idPrenotazione` int(11) NOT NULL,
  `dataPrenotazione` datetime NOT NULL,
  `durata` varchar(10) NOT NULL,
  `checkIn` datetime NOT NULL,
  `checkOut` datetime NOT NULL,
  `costoTotale` decimal(10,2) NOT NULL,
  `totaleStanzePrenotate` int(11) NOT NULL,
  `tipoPagamento` varchar(30) NOT NULL,
  `idHotel` int(11) NOT NULL,
  `idOspite` int(11) NOT NULL,
  `idImpiegato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Prenotazioni`
--

INSERT INTO `Prenotazioni` (`idPrenotazione`, `dataPrenotazione`, `durata`, `checkIn`, `checkOut`, `costoTotale`, `totaleStanzePrenotate`, `tipoPagamento`, `idHotel`, `idOspite`, `idImpiegato`) VALUES
(1, '2021-12-16 10:00:00', '5 giorni', '2021-12-23 15:30:00', '2021-12-26 11:00:00', '561.50', 2, 'bancomat', 1, 4, 4),
(2, '2021-09-27 15:00:00', '2 giorni', '2021-09-28 18:01:35', '2021-09-30 12:24:00', '150.00', 1, 'contanti', 1, 2, 5),
(3, '2022-02-08 18:52:54', '6 giorni', '2022-06-14 10:00:00', '2022-06-19 10:30:00', '1720.95', 4, 'bancomat', 1, 3, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `Recensioni`
--

CREATE TABLE `Recensioni` (
  `idRecensione` int(11) NOT NULL,
  `testo` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Recensioni`
--

INSERT INTO `Recensioni` (`idRecensione`, `testo`) VALUES
(1, 'Hotel pulito e accogliente. Lo staff è super efficiente e allo stesso tempo molto cordiale e sempre disponibile ad ogni tipo di esigenza. Il cibo è sempre fresco abbondante e di ottima qualità.'),
(2, 'Abbiamo scelto questa struttura in maniera del tutto casuale, affidandoci alla buona sorte fiduciosi delle recensioni ed è stata la scelta migliore che potessimo mai fare.'),
(3, 'Hotel accogliente, ottimo livello di pulizia, colazione e cena buone e abbondanti con vasta varietà di pasti.'),
(4, 'Staff cordiale e disponibile, cibo veramente buono con vasta scelta ogni giorno e un buffet molto fornito, pulizia camere eccellente.'),
(5, 'È la terza volta che soggiorno all Hotel Palace e lo consiglio per l ottimo rapporto qualità prezzo, e per come si sta in generale. Personale disponibile e gentile e cucina buona!');

-- --------------------------------------------------------

--
-- Struttura della tabella `ServiziHotel`
--

CREATE TABLE `ServiziHotel` (
  `idServizio` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descrizione` varchar(300) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `idHotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `ServiziHotel`
--

INSERT INTO `ServiziHotel` (`idServizio`, `nome`, `descrizione`, `costo`, `idHotel`) VALUES
(1, 'Ristorante', 'Possibilità di colazione, pranzo e cena; tutto buffet, colazione compresa nella prenotazione; costo al giorno', '10.00', 1),
(2, 'Palestra', 'Ampia palestra con attrezzi e macchine isotoniche; costo al giorno', '25.00', 1),
(3, 'Spa', 'Sauna, bagno turco, piscine interne e esterne e trattamenti di bellezza; costo al giorno', '40.00', 1),
(4, 'Discoteca', 'Ampia area ballo; costo a serata', '20.00', 1),
(5, 'Bar', 'Caffetteria, cocktail, long drinks e distillati; costo incluso nella prenotazione', '0.00', 1),
(6, 'Parcheggio', 'Ampio parcheggio per le vetture; costo al giorno', '5.00', 1),
(7, 'Sala da gioco', 'Tavoli da blackjack, poker, slots e molto altro..', '0.00', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ServiziUsatiDagliOspiti`
--

CREATE TABLE `ServiziUsatiDagliOspiti` (
  `idServizioUsato` int(11) NOT NULL,
  `idServizio` int(11) NOT NULL,
  `idPrenotazione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `ServiziUsatiDagliOspiti`
--

INSERT INTO `ServiziUsatiDagliOspiti` (`idServizioUsato`, `idServizio`, `idPrenotazione`) VALUES
(1, 1, 2),
(2, 5, 3),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `Stanze`
--

CREATE TABLE `Stanze` (
  `idStanza` int(11) NOT NULL,
  `numero` int(4) NOT NULL,
  `idHotel` int(11) NOT NULL,
  `idTipoStanza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Stanze`
--

INSERT INTO `Stanze` (`idStanza`, `numero`, `idHotel`, `idTipoStanza`) VALUES
(1, 66, 1, 1),
(2, 101, 1, 5),
(3, 231, 1, 2),
(4, 99, 1, 4),
(5, 1, 1, 6),
(6, 245, 1, 3),
(7, 77, 1, 1),
(8, 123, 1, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `StanzePrenotate`
--

CREATE TABLE `StanzePrenotate` (
  `idStanzaPrenotata` int(11) NOT NULL,
  `idPrenotazione` int(11) NOT NULL,
  `idStanza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `StanzePrenotate`
--

INSERT INTO `StanzePrenotate` (`idStanzaPrenotata`, `idPrenotazione`, `idStanza`) VALUES
(1, 1, 3),
(2, 1, 3),
(3, 2, 1),
(4, 3, 2),
(5, 3, 2),
(6, 3, 2),
(7, 3, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `TipiDiStanze`
--

CREATE TABLE `TipiDiStanze` (
  `idTipoStanza` int(11) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `descrizione` varchar(300) NOT NULL,
  `animali` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `TipiDiStanze`
--

INSERT INTO `TipiDiStanze` (`idTipoStanza`, `categoria`, `costo`, `descrizione`, `animali`) VALUES
(1, 'Stanza singola', '70.00', '1 letto singolo, 1 bagno\r\n', 'Si'),
(2, 'Stanza doppia', '140.00', '1 letto matrimoniale, 1 bagno', 'Si'),
(3, 'Stanza tripla', '175.00', '1 letto matrimoniale, 1 letto singolo, 1 bagno', 'Si'),
(4, 'Stanza quadrupla', '200.00', '2 letti matrimoniali, 2 bagni', 'Si'),
(5, 'Suite', '300.00', 'Stanza con due zone separate: zona notte (1 letto matrimoniale, 1 letto singolo, 1 bagno), zona giorno (2 divani, 1 bagno)', 'Si'),
(6, 'Junior suite', '375.00', 'Stanza con zona soggiorno, 1 letto matrimoniale, 2 bagni, 1 divano', 'No');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Dipartimenti`
--
ALTER TABLE `Dipartimenti`
  ADD PRIMARY KEY (`idDipartimento`);

--
-- Indici per le tabelle `Hotel`
--
ALTER TABLE `Hotel`
  ADD PRIMARY KEY (`idHotel`,`idIndirizzo`,`idRecensione`),
  ADD KEY `idIndirizzo` (`idIndirizzo`,`idRecensione`),
  ADD KEY `fk_hotel_recensione1` (`idRecensione`);

--
-- Indici per le tabelle `Impiegati`
--
ALTER TABLE `Impiegati`
  ADD PRIMARY KEY (`idImpiegato`,`idHotel`,`idIndirizzo`,`idDipartimento`),
  ADD KEY `idHotel` (`idHotel`,`idIndirizzo`,`idDipartimento`),
  ADD KEY `idIndirizzo` (`idIndirizzo`),
  ADD KEY `fk_impiegati_dipartimento1` (`idDipartimento`);

--
-- Indici per le tabelle `Indirizzi`
--
ALTER TABLE `Indirizzi`
  ADD PRIMARY KEY (`idIndirizzo`);

--
-- Indici per le tabelle `Ospiti`
--
ALTER TABLE `Ospiti`
  ADD PRIMARY KEY (`idOspite`,`idIndirizzo`),
  ADD KEY `idIndirizzo` (`idIndirizzo`);

--
-- Indici per le tabelle `Prenotazioni`
--
ALTER TABLE `Prenotazioni`
  ADD PRIMARY KEY (`idPrenotazione`,`idHotel`,`idOspite`,`idImpiegato`),
  ADD KEY `idHotel` (`idHotel`,`idOspite`,`idImpiegato`),
  ADD KEY `fk_prenotazioni_ospite1` (`idOspite`),
  ADD KEY `fk_prenotazioni_impieagato1` (`idImpiegato`);

--
-- Indici per le tabelle `Recensioni`
--
ALTER TABLE `Recensioni`
  ADD PRIMARY KEY (`idRecensione`);

--
-- Indici per le tabelle `ServiziHotel`
--
ALTER TABLE `ServiziHotel`
  ADD PRIMARY KEY (`idServizio`,`idHotel`),
  ADD KEY `idHotel` (`idHotel`);

--
-- Indici per le tabelle `ServiziUsatiDagliOspiti`
--
ALTER TABLE `ServiziUsatiDagliOspiti`
  ADD PRIMARY KEY (`idServizioUsato`,`idServizio`,`idPrenotazione`),
  ADD KEY `idServizio` (`idServizio`,`idPrenotazione`),
  ADD KEY `fk_serviziUsatiDagliOspiti_prenotazione_1` (`idPrenotazione`);

--
-- Indici per le tabelle `Stanze`
--
ALTER TABLE `Stanze`
  ADD PRIMARY KEY (`idStanza`,`idHotel`,`idTipoStanza`),
  ADD KEY `idHotel` (`idHotel`,`idTipoStanza`),
  ADD KEY `fk_stanze_tipoStanza_1` (`idTipoStanza`);

--
-- Indici per le tabelle `StanzePrenotate`
--
ALTER TABLE `StanzePrenotate`
  ADD PRIMARY KEY (`idStanzaPrenotata`,`idPrenotazione`,`idStanza`),
  ADD KEY `idPrenotazione` (`idPrenotazione`,`idStanza`),
  ADD KEY `fk_stanzePprenotate_stanza_1` (`idStanza`);

--
-- Indici per le tabelle `TipiDiStanze`
--
ALTER TABLE `TipiDiStanze`
  ADD PRIMARY KEY (`idTipoStanza`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Dipartimenti`
--
ALTER TABLE `Dipartimenti`
  MODIFY `idDipartimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `Hotel`
--
ALTER TABLE `Hotel`
  MODIFY `idHotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `Impiegati`
--
ALTER TABLE `Impiegati`
  MODIFY `idImpiegato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `Indirizzi`
--
ALTER TABLE `Indirizzi`
  MODIFY `idIndirizzo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `Ospiti`
--
ALTER TABLE `Ospiti`
  MODIFY `idOspite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `Prenotazioni`
--
ALTER TABLE `Prenotazioni`
  MODIFY `idPrenotazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `Recensioni`
--
ALTER TABLE `Recensioni`
  MODIFY `idRecensione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `ServiziHotel`
--
ALTER TABLE `ServiziHotel`
  MODIFY `idServizio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `ServiziUsatiDagliOspiti`
--
ALTER TABLE `ServiziUsatiDagliOspiti`
  MODIFY `idServizioUsato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `Stanze`
--
ALTER TABLE `Stanze`
  MODIFY `idStanza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `StanzePrenotate`
--
ALTER TABLE `StanzePrenotate`
  MODIFY `idStanzaPrenotata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `TipiDiStanze`
--
ALTER TABLE `TipiDiStanze`
  MODIFY `idTipoStanza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Hotel`
--
ALTER TABLE `Hotel`
  ADD CONSTRAINT `fk_hotel_indirizzo1` FOREIGN KEY (`idIndirizzo`) REFERENCES `Indirizzi` (`idIndirizzo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hotel_recensione1` FOREIGN KEY (`idRecensione`) REFERENCES `Recensioni` (`idRecensione`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `Impiegati`
--
ALTER TABLE `Impiegati`
  ADD CONSTRAINT `fk_impiegati_dipartimento1` FOREIGN KEY (`idDipartimento`) REFERENCES `Dipartimenti` (`idDipartimento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_impiegati_hotel1` FOREIGN KEY (`idHotel`) REFERENCES `Hotel` (`idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_impiegati_indirizzo1` FOREIGN KEY (`idIndirizzo`) REFERENCES `Indirizzi` (`idIndirizzo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `Indirizzi`
--
ALTER TABLE `Indirizzi`
  ADD CONSTRAINT `indirizzi_ibfk_1` FOREIGN KEY (`idIndirizzo`) REFERENCES `Hotel` (`idIndirizzo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `Ospiti`
--
ALTER TABLE `Ospiti`
  ADD CONSTRAINT `fk_ospiti_indirizzo1` FOREIGN KEY (`idIndirizzo`) REFERENCES `Indirizzi` (`idIndirizzo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `Prenotazioni`
--
ALTER TABLE `Prenotazioni`
  ADD CONSTRAINT `fk_prenotazioni_hotel1` FOREIGN KEY (`idHotel`) REFERENCES `Hotel` (`idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prenotazioni_impieagato1` FOREIGN KEY (`idImpiegato`) REFERENCES `Impiegati` (`idImpiegato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prenotazioni_ospite1` FOREIGN KEY (`idOspite`) REFERENCES `Ospiti` (`idOspite`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `ServiziHotel`
--
ALTER TABLE `ServiziHotel`
  ADD CONSTRAINT `fk_serviziHotel_hotel1` FOREIGN KEY (`idHotel`) REFERENCES `Hotel` (`idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `ServiziUsatiDagliOspiti`
--
ALTER TABLE `ServiziUsatiDagliOspiti`
  ADD CONSTRAINT `fk_serviziUsatiDagliOspiti_prenotazione_1` FOREIGN KEY (`idPrenotazione`) REFERENCES `Prenotazioni` (`idPrenotazione`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_serviziUsatiDagliOspiti_servizio_1` FOREIGN KEY (`idServizio`) REFERENCES `ServiziHotel` (`idServizio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `Stanze`
--
ALTER TABLE `Stanze`
  ADD CONSTRAINT `fk_stanze_hotel_1` FOREIGN KEY (`idHotel`) REFERENCES `Hotel` (`idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stanze_tipoStanza_1` FOREIGN KEY (`idTipoStanza`) REFERENCES `TipiDiStanze` (`idTipoStanza`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `StanzePrenotate`
--
ALTER TABLE `StanzePrenotate`
  ADD CONSTRAINT `fk_stanzePprenotate_stanza_1` FOREIGN KEY (`idStanza`) REFERENCES `Stanze` (`idStanza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stanzePrenotate_prenotazione_1` FOREIGN KEY (`idPrenotazione`) REFERENCES `Prenotazioni` (`idPrenotazione`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
