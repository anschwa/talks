package authorizer // import "example.com/services/authorizer"

type User struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

type Authorizer struct{}

func New() *Authorizer {
	return &Authorizer{}
}

func (a *Authorizer) Authorize(u User) bool {
	return u.Name == "admin"
}
