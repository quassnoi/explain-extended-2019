WITH	RECURSIVE
	bin AS
	(
	SELECT	DECODE(data, 'HEX') AS buffer
	FROM	input
	)
SELECT	ENCODE(buffer, 'HEX')
FROM	bin;

