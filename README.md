# siphash-hoon

Siphash-2-4 implementation in hoon for urbit. 

Takes 128-bit key and n-byte message as `byts` type and returns 64-bit hash as `byts` type

## Usage

* add `siphash.hoon` to `/lib`
* `|commit %home`
* import `/- *siphash`
* call `(siphash key msg)`

## Tests

Included is `siptest.hoon` generator which runs the 64 test vectors from the C implementation.
