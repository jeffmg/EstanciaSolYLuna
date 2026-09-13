CREATE TABLE `records` (
	`id` text NOT NULL,
	`owner` text NOT NULL,
	`kind` text NOT NULL,
	`name` text NOT NULL,
	`amount` real NOT NULL,
	`date` text NOT NULL,
	`apartment` text NOT NULL,
	`note` text DEFAULT '' NOT NULL,
	`file_key` text,
	`file_name` text,
	PRIMARY KEY(`owner`, `id`)
);
