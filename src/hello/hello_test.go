package hello_test

import (
	"testing"

	"github.com/bannmoore/golang-seed/src/hello"
	"github.com/stretchr/testify/assert"
)

func TestHello(t *testing.T) {
	assert.Equal(t, "hello", hello.Hello())
}
