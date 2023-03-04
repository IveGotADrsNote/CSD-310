CREATE USER 'pysports_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'E@versus12';

GRANT ALL PRIVILEGES ON pysports.* TO 'pysports_user'@'localhost';

DROP USER IF EXISTS 'pysports_user'@'localhost';

CREATE TABLE team (
    team_id     INT         NOT NULL    AUTO_INCREMENT,
    team_name   VARCHAR(75) NOT NULL,
    mascot      VARCHAR(75) NOT NULL,
    PRIMARY KEY(team_id)
);

CREATE TABLE player (
    player_id   INT         NOT NULL    AUTO_INCREMENT,
    first_name  VARCHAR(75) NOT NULL,
    last_name   VARCHAR(75) NOT NULL,
    team_id     INT         NOT NULL,
    PRIMARY KEY(player_id),
    CONSTRAINT fk_team
    FOREIGN KEY(team_id)
        REFERENCES team(team_id)
);

INSERT INTO team(team_name, mascot)
    VALUES('Team Gandalf', 'White Wizards');

DROP TABLE IF EXISTS player;

SELECT team_id FROM team WHERE team_name = 'Team Sauron';

