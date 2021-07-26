-- CreateTable
CREATE TABLE `Accounts` (
    `id` INTEGER NOT NULL,
    `id_account` INTEGER NOT NULL,
    `id_account_types` INTEGER NOT NULL,
    `username` VARCHAR(70) NOT NULL,
    `password` VARCHAR(16) NOT NULL,

    UNIQUE INDEX `Accounts.username_unique`(`username`),
    INDEX `FK_AdminID`(`id_account`),
    INDEX `id_account_types`(`id_account_types`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Subject_matters` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Indicators` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_subject` INTEGER NOT NULL,
    `topic` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `code_number` VARCHAR(191) NOT NULL,
    `link` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Contracts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_student` INTEGER NOT NULL,
    `id_subject` INTEGER NOT NULL,
    `progress` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `link` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Student_answer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_contract` INTEGER NOT NULL,
    `id_question` INTEGER NOT NULL,
    `id_answers` INTEGER NOT NULL,
    `numbers_of_loop` INTEGER NOT NULL,
    `date` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Questions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_indicator` INTEGER NOT NULL,
    `question_types` INTEGER NOT NULL,
    `question` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Answers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `answer` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Question_answers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_question` INTEGER NOT NULL,
    `id_question_answer` INTEGER NOT NULL,
    `status` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Question_types` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Accounts` ADD FOREIGN KEY (`id_account`) REFERENCES `Students`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Accounts` ADD FOREIGN KEY (`id_account`) REFERENCES `Admins`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Accounts` ADD FOREIGN KEY (`id_account_types`) REFERENCES `Account_types`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Indicators` ADD FOREIGN KEY (`id_subject`) REFERENCES `Subject_matters`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Contracts` ADD FOREIGN KEY (`id_student`) REFERENCES `Students`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Contracts` ADD FOREIGN KEY (`id_subject`) REFERENCES `Subject_matters`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Student_answer` ADD FOREIGN KEY (`id_contract`) REFERENCES `Contracts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Student_answer` ADD FOREIGN KEY (`id_question`) REFERENCES `Questions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Student_answer` ADD FOREIGN KEY (`id_answers`) REFERENCES `Answers`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Questions` ADD FOREIGN KEY (`id_indicator`) REFERENCES `Indicators`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Questions` ADD FOREIGN KEY (`question_types`) REFERENCES `Question_types`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Question_answers` ADD FOREIGN KEY (`id_question_answer`) REFERENCES `Answers`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Question_answers` ADD FOREIGN KEY (`id_question`) REFERENCES `Questions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
