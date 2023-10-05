postgres:
	docker run --name some-postgres12 -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d postgres

createdb:
	docker exec -it some-postgres12 createdb --username=postgres --owner=postgres example

dropdb:
	docker exec -it some-postgres12 dropdb example

migrateup:
	migrate -path db/migration -database "postgresql://postgres:mysecretpassword@localhost:5432/example?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:mysecretpassword@localhost:5432/example?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migratedown migrateup