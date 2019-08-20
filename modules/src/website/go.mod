module example.com/services/website

go 1.12

require (
	example.com/services/authorizer v0.0.0-00010101000000-000000000000
	github.com/gin-gonic/gin v1.4.0
)

replace example.com/services/authorizer => /home/schwa/Development/talks/modules/src/authorizer
