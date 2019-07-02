package hello_test

import (
	"testing"

	"github.com/bannmoore/golang-seed/src/hello"
	"github.com/stretchr/testify/assert"
)

func BenchmarkHello(b *testing.B) {
	for i := 0; i < b.N; i++ {
		hello.Hello()
	}
}

func TestHello(t *testing.T) {
	assert.Equal(t, "hello", hello.Hello())
}
