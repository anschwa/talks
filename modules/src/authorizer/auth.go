package auth

type AuthUser struct {
	ID int
	Subscription string
}

func (au *AuthUser) SecretQuestion() string {
	return "What is six times nine?"
}
