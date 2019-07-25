;; Test all the i8x16 comparison operators on major boundary values and all special values.

(module
  (func (export "eq") (param $x v128) (param $y v128) (result v128) (i8x16.eq (local.get $x) (local.get $y)))
  (func (export "ne") (param $x v128) (param $y v128) (result v128) (i8x16.ne (local.get $x) (local.get $y)))
  (func (export "lt_s") (param $x v128) (param $y v128) (result v128) (i8x16.lt_s (local.get $x) (local.get $y)))
  (func (export "lt_u") (param $x v128) (param $y v128) (result v128) (i8x16.lt_u (local.get $x) (local.get $y)))
  (func (export "le_s") (param $x v128) (param $y v128) (result v128) (i8x16.le_s (local.get $x) (local.get $y)))
  (func (export "le_u") (param $x v128) (param $y v128) (result v128) (i8x16.le_u (local.get $x) (local.get $y)))
  (func (export "gt_s") (param $x v128) (param $y v128) (result v128) (i8x16.gt_s (local.get $x) (local.get $y)))
  (func (export "gt_u") (param $x v128) (param $y v128) (result v128) (i8x16.gt_u (local.get $x) (local.get $y)))
  (func (export "ge_s") (param $x v128) (param $y v128) (result v128) (i8x16.ge_s (local.get $x) (local.get $y)))
  (func (export "ge_u") (param $x v128) (param $y v128) (result v128) (i8x16.ge_u (local.get $x) (local.get $y)))
)

;; eq

;; i8x16.eq  (i8x16) (i8x16)
;; hex vs hex
(assert_return (invoke "eq" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                            (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0)
                            (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                            (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                            (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                            (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; hex vs dec
(assert_return (invoke "eq" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                            (v128.const i8x16 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                            (v128.const i8x16 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                            (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 0 0 1 2 127 128 253 254 255))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; dec vs dec
(assert_return (invoke "eq" (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                            (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0)
                            (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255)
                            (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                            (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 -0 0 1 2 127 128 253 254 255))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; hex vs float
(assert_return (invoke "eq" (v128.const i8x16 0x00 0x00 0x00 0xc3 0x00 0x00 0xfe 0xc2 0x00 0x00 0x80 0xbf 0x00 0x00 0x00 0x00)
                            (v128.const f32x4 -128.0 -127.0 -1.0 0.0))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "eq" (v128.const i8x16 0x00 0x00 0x80 0x3f 0x00 0x00 0xfe 0x42 0x00 0x00 0x00 0x43 0x00 0x00 0x7f 0x43)
                            (v128.const f32x4 1.0 127.0 128.0 255.0))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; not equal
(assert_return (invoke "eq" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                            (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "eq" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "eq" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                            (v128.const i8x16 0xFF 0xAB 0xAA 0x1B 0x1A 0x0B 0x0A 0x12 0x11 0x10 0x09 0x04 0x03 0x02 0x01 0x00))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "eq" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                            (v128.const i8x16 255 254 253 128 127 2 1 0 0 -1 -2 -3 -125 -126 -127 -128))
                            (v128.const i8x16 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0))
(assert_return (invoke "eq" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                            (v128.const i8x16 255 254 253 128 127 2 1 0 -0 -1 -2 -3 -125 -126 -127 -128))
                            (v128.const i8x16 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0))

;; i8x16.eq  (i8x16) (i16x8)
(assert_return (invoke "eq" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i16x8 0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "eq" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                            (v128.const i16x8 65535   65535   65535   65535   65535   65535   65535   65535))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "eq" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                            (v128.const i16x8 0   0   0   0   0   0   0   0))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "eq" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                            (v128.const i16x8 0x0100    0x0302    0x0504    0x0706    0x0908    0x0B0A    0x0D0C    0x0F0E))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "eq" (v128.const i8x16 -128 -127 -126 -125   -3 -2 -1 0   0 1 2 127   128 253 254 255)
                            (v128.const i16x8 33152     33666       65277  255   256 32514   64896   65534))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


(assert_return (invoke "eq" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                            (v128.const i16x8 -128      -128         0     0       1     1       255     255))
                            (v128.const i8x16 -1 0 -1 0 -1 -1 -1 -1 -1 0 -1 0 -1 0 -1 0))

(assert_return (invoke "eq" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                            (v128.const i16x8 0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; i8x16.eq  (i8x16) (i32x4)
(assert_return (invoke "eq" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i32x4 0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "eq" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                            (v128.const i32x4 4294967295      4294967295      4294967295      4294967295))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "eq" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                            (v128.const i32x4 0  0  0  0))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "eq" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                            (v128.const i32x4 0x03020100          0x07060504          0x0B0A0908          0x0F0E0D0C))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "eq" (v128.const i8x16 -128 -127 -126 -125    -3 -2 -1 0    0 1 2 127    128 253 254 255)
                            (v128.const i32x4 2206368128             16776957      2130837760   4294901120))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


(assert_return (invoke "eq" (v128.const i8x16 -128 -128 -128 -128    0 0 0 0    1 1 1 1    255 255 255 255)
                            (v128.const i32x4 -128                   0          1          255))
                            (v128.const i8x16 -1 0 0 0 -1 -1 -1 -1 -1 0 0 0 -1 0 0 0))

(assert_return (invoke "eq" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                            (v128.const i32x4 0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


;; ne
;; i8x16.ne  (i8x16) (i8x16)
;; hex vs hex
(assert_return (invoke "ne" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                            (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0)
                            (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                            (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                            (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                            (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; hex vs dec
(assert_return (invoke "ne" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                            (v128.const i8x16 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                            (v128.const i8x16 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                            (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 0 0 1 2 127 128 253 254 255))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; dec vs dec
(assert_return (invoke "ne" (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                            (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0)
                            (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255)
                            (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                            (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 -0 0 1 2 127 128 253 254 255))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; hex vs float
(assert_return (invoke "ne" (v128.const i8x16 0x00 0x00 0x00 0xc3 0x00 0x00 0xfe 0xc2 0x00 0x00 0x80 0xbf 0x00 0x00 0x00 0x00)
                            (v128.const f32x4 -128.0 -127.0 -1.0 0.0))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ne" (v128.const i8x16 0x00 0x00 0x80 0x3f 0x00 0x00 0xfe 0x42 0x00 0x00 0x00 0x43 0x00 0x00 0x7f 0x43)
                            (v128.const f32x4 1.0 127.0 128.0 255.0))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; not equal
(assert_return (invoke "ne" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                            (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ne" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ne" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                            (v128.const i8x16 0xFF 0xAB 0xAA 0x1B 0x1A 0x0B 0x0A 0x12 0x11 0x10 0x09 0x04 0x03 0x02 0x01 0x00))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ne" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                            (v128.const i8x16 255 254 253 128 127 2 1 0 0 -1 -2 -3 -125 -126 -127 -128))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 0 0 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ne" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                            (v128.const i8x16 255 254 253 128 127 2 1 0 -0 -1 -2 -3 -125 -126 -127 -128))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 0 0 -1 -1 -1 -1 -1 -1 -1))

;; i8x16.ne  (i8x16) (i16x8)
(assert_return (invoke "ne" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i16x8 0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "ne" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                            (v128.const i16x8 65535   65535   65535   65535   65535   65535   65535   65535))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "ne" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                            (v128.const i16x8 0   0   0   0   0   0   0   0))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "ne" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                            (v128.const i16x8 0x0100    0x0302    0x0504    0x0706    0x0908    0x0B0A    0x0D0C    0x0F0E))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "ne" (v128.const i8x16 -128 -127 -126 -125   -3 -2 -1 0   0 1 2 127   128 253 254 255)
                            (v128.const i16x8 33152     33666       65277  255   256 32514   64896   65534))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


(assert_return (invoke "ne" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                            (v128.const i16x8 -128      -128         0     0       1     1       255     255))
                            (v128.const i8x16 0    -1   0    -1      0  0  0  0    0  -1 0  -1   0   -1  0   -1))

(assert_return (invoke "ne" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                            (v128.const i16x8 0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; i8x16.ne  (i8x16) (i32x4)
(assert_return (invoke "ne" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                            (v128.const i32x4 0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "ne" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                            (v128.const i32x4 4294967295      4294967295      4294967295      4294967295))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "ne" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                            (v128.const i32x4 0  0  0  0))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "ne" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                            (v128.const i32x4 0x03020100          0x07060504          0x0B0A0908          0x0F0E0D0C))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "ne" (v128.const i8x16 -128 -127 -126 -125    -3 -2 -1 0    0 1 2 127    128 253 254 255)
                            (v128.const i32x4 2206368128             16776957      2130837760   4294901120))
                            (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


(assert_return (invoke "ne" (v128.const i8x16 -128 -128 -128 -128    0 0 0 0    1  1  1  1    255 255 255 255)
                            (v128.const i32x4 -128                   0          1             255))
                            (v128.const i8x16 0 -1 -1 -1 0 0 0 0 0 -1 -1 -1 0 -1 -1 -1))

(assert_return (invoke "ne" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                            (v128.const i32x4 0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA))
                            (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


;; lt_s

;; i8x16.lt_s  (i8x16) (i8x16)
;; hex vs hex
(assert_return (invoke "lt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; hex vs dec
(assert_return (invoke "lt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; dec vs dec
(assert_return (invoke "lt_s" (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 -0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; hex vs float
(assert_return (invoke "lt_s" (v128.const i8x16 0x00 0x00 0x00 0xc3 0x00 0x00 0xfe 0xc2 0x00 0x00 0x80 0xbf 0x00 0x00 0x00 0x00)
                              (v128.const f32x4 -128.0 -127.0 -1.0 0.0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0x00 0x00 0x80 0x3f 0x00 0x00 0xfe 0x42 0x00 0x00 0x00 0x43 0x00 0x00 0x7f 0x43)
                              (v128.const f32x4 1.0 127.0 128.0 255.0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; not equal
(assert_return (invoke "lt_s" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "lt_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0xFF 0xAB 0xAA 0x1B 0x1A 0x0B 0x0A 0x12 0x11 0x10 0x09 0x04 0x03 0x02 0x01 0x00))
                              (v128.const i8x16 0 0 0 -1 -1 -1 0 -1 0 -1 0 0 0 -1 -1 -1))
(assert_return (invoke "lt_s" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 -1 -1 -1 0 -1 -1 -1 0 0 0 0 0 -1 0 0 0))
(assert_return (invoke "lt_s" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 -0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 -1 -1 -1 0 -1 -1 -1 0 0 0 0 0 -1 0 0 0))

;; i8x16.lt_s  (i8x16) (i16x8)
(assert_return (invoke "lt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i16x8 0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i16x8 65535   65535   65535   65535   65535   65535   65535   65535))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i16x8 0   0   0   0   0   0   0   0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i16x8 0x0100    0x0302    0x0504    0x0706    0x0908    0x0B0A    0x0D0C    0x0F0E))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_s" (v128.const i8x16 -128 -127 -126 -125   -3 -2 -1 0   0 1 2 127   128 253 254 255)
                              (v128.const i16x8 33152     33666       65277  255   256 32514   64896   65534))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


(assert_return (invoke "lt_s" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i16x8 -128      -128         0     0       1     1       255     255))
                              (v128.const i8x16 0 -1 0 -1 0 0 0 0 0 0 0 0 0 -1 0 -1))

(assert_return (invoke "lt_s" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i16x8 0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; i8x16.lt_s  (i8x16) (i32x4)
(assert_return (invoke "lt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i32x4 0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i32x4 4294967295      4294967295      4294967295      4294967295))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i32x4 0  0  0  0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i32x4 0x03020100          0x07060504          0x0B0A0908          0x0F0E0D0C))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_s" (v128.const i8x16 -128 -127 -126 -125    -3 -2 -1 0    0 1 2 127    128 253 254 255)
                              (v128.const i32x4 2206368128             16776957      2130837760   4294901120))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


(assert_return (invoke "lt_s" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i32x4 -128                   0             1             255))
                              (v128.const i8x16 0 -1 -1 -1 0 0 0 0 0 0 0 0 0 -1 -1 -1))

(assert_return (invoke "lt_s" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i32x4 0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


;; lt_u

;; i8x16.lt_u  (i8x16) (i8x16)
;; hex vs hex
(assert_return (invoke "lt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; hex vs dec
(assert_return (invoke "lt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; dec vs dec
(assert_return (invoke "lt_u" (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 -0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; hex vs float
(assert_return (invoke "lt_u" (v128.const i8x16 0x00 0x00 0x00 0xc3 0x00 0x00 0xfe 0xc2 0x00 0x00 0x80 0xbf 0x00 0x00 0x00 0x00)
                              (v128.const f32x4 -128.0 -127.0 -1.0 0.0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0x00 0x00 0x80 0x3f 0x00 0x00 0xfe 0x42 0x00 0x00 0x00 0x43 0x00 0x00 0x7f 0x43)
                              (v128.const f32x4 1.0 127.0 128.0 255.0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; not equal
(assert_return (invoke "lt_u" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "lt_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 0 0 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0xFF 0xAB 0xAA 0x1B 0x1A 0x0B 0x0A 0x12 0x11 0x10 0x09 0x04 0x03 0x02 0x01 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 0 -1 0 -1 0 0 0 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 -1 -1 -1 0 0 0 0 0 0 -1 -1 -1 -1 0 0 0))
(assert_return (invoke "lt_u" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 -0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 -1 -1 -1 0 0 0 0 0 0 -1 -1 -1 -1 0 0 0))

;; i8x16.lt_u  (i8x16) (i16x8)
(assert_return (invoke "lt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i16x8 0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i16x8 65535   65535   65535   65535   65535   65535   65535   65535))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i16x8 0   0   0   0   0   0   0   0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i16x8 0x0100    0x0302    0x0504    0x0706    0x0908    0x0B0A    0x0D0C    0x0F0E))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_u" (v128.const i8x16 -128 -127 -126 -125   -3 -2 -1 0   0 1 2 127   128 253 254 255)
                              (v128.const i16x8 33152     33666       65277  255   256 32514   64896   65534))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


(assert_return (invoke "lt_u" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i16x8 -128      -128         0     0       1     1       255     255))
                              (v128.const i8x16 0 -1 0 -1 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_u" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i16x8 0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; i8x16.lt_u  (i8x16) (i32x4)
(assert_return (invoke "lt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i32x4 0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i32x4 4294967295      4294967295      4294967295      4294967295))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i32x4 0  0  0  0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i32x4 0x03020100          0x07060504          0x0B0A0908          0x0F0E0D0C))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_u" (v128.const i8x16 -128 -127 -126 -125    -3 -2 -1 0    0 1 2 127    128 253 254 255)
                              (v128.const i32x4 2206368128            16776957      2130837760    4294901120))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


(assert_return (invoke "lt_u" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i32x4 -128                   0             1             255))
                              (v128.const i8x16 0 -1 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "lt_u" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i32x4 0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; le_s

;; i8x16.le_s  (i8x16) (i8x16)
;; hex vs hex
(assert_return (invoke "le_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; hex vs dec
(assert_return (invoke "le_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; dec vs dec
(assert_return (invoke "le_s" (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 -0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; hex vs float
(assert_return (invoke "le_s" (v128.const i8x16 0x00 0x00 0x00 0xc3 0x00 0x00 0xfe 0xc2 0x00 0x00 0x80 0xbf 0x00 0x00 0x00 0x00)
                              (v128.const f32x4 -128.0 -127.0 -1.0 0.0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0x00 0x00 0x80 0x3f 0x00 0x00 0xfe 0x42 0x00 0x00 0x00 0x43 0x00 0x00 0x7f 0x43)
                              (v128.const f32x4 1.0 127.0 128.0 255.0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; not equal
(assert_return (invoke "le_s" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "le_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0xFF 0xAB 0xAA 0x1B 0x1A 0x0B 0x0A 0x12 0x11 0x10 0x09 0x04 0x03 0x02 0x01 0x00))
                              (v128.const i8x16 0 0 0 -1 -1 -1 0 -1 0 -1 0 0 0 -1 -1 -1))
(assert_return (invoke "le_s" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 -1 -1 -1 0 -1 -1 -1 -1 -1 0 0 0 -1 0 0 0))
(assert_return (invoke "le_s" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 -0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 -1 -1 -1 0 -1 -1 -1 -1 -1 0 0 0 -1 0 0 0))

;; i8x16.le_s  (i8x16) (i16x8)
(assert_return (invoke "le_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i16x8 0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i16x8 65535   65535   65535   65535   65535   65535   65535   65535))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i16x8 0   0   0   0   0   0   0   0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i16x8 0x0100    0x0302    0x0504    0x0706    0x0908    0x0B0A    0x0D0C    0x0F0E))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_s" (v128.const i8x16 -128 -127 -126 -125   -3 -2 -1 0   0 1 2 127   128 253 254 255)
                              (v128.const i16x8 33152     33666       65277  255   256 32514   64896   65534))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


(assert_return (invoke "le_s" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i16x8 -128      -128         0     0       1     1       255     255))
                              (v128.const i8x16  -1 -1 -1 -1 -1 -1 -1 -1 -1 0 -1 0 -1 -1 -1 -1))

(assert_return (invoke "le_s" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i16x8 0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA))
                              (v128.const i8x16  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; i8x16.le_s  (i8x16) (i32x4)
(assert_return (invoke "le_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i32x4 0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i32x4 4294967295      4294967295      4294967295      4294967295))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i32x4 0  0  0  0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i32x4 0x03020100          0x07060504          0x0B0A0908          0x0F0E0D0C))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_s" (v128.const i8x16 -128 -127 -126 -125    -3 -2 -1 0    0 1 2 127     128 253 254 255)
                              (v128.const i32x4 2206368128             16776957      2130837760    4294901120))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


(assert_return (invoke "le_s" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i32x4 -128                   0             1             255))
                              (v128.const i8x16 -1   -1   -1   -1      -1 -1 -1 -1   -1 0 0 0      -1  -1   -1  -1))

(assert_return (invoke "le_s" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i32x4 0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; le_u

;; i8x16.le_u  (i8x16) (i8x16)
;; hex vs hex
(assert_return (invoke "le_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; hex vs dec
(assert_return (invoke "le_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; dec vs dec
(assert_return (invoke "le_u" (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 -0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; hex vs float
(assert_return (invoke "le_u" (v128.const i8x16 0x00 0x00 0x00 0xc3 0x00 0x00 0xfe 0xc2 0x00 0x00 0x80 0xbf 0x00 0x00 0x00 0x00)
                              (v128.const f32x4 -128.0 -127.0 -1.0 0.0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0x00 0x00 0x80 0x3f 0x00 0x00 0xfe 0x42 0x00 0x00 0x00 0x43 0x00 0x00 0x7f 0x43)
                              (v128.const f32x4 1.0 127.0 128.0 255.0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; not equal
(assert_return (invoke "le_u" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "le_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 0 0 0 0 0 0 0 0))
(assert_return (invoke "le_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0xFF 0xAB 0xAA 0x1B 0x1A 0x0B 0x0A 0x12 0x11 0x10 0x09 0x04 0x03 0x02 0x01 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 0 -1 0 -1 0 0 0 0 0 0))
(assert_return (invoke "le_u" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 -1 -1 -1 0 0 0 0 -1 -1 -1 -1 -1 -1 0 0 0))
(assert_return (invoke "le_u" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 -0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 -1 -1 -1 0 0 0 0 -1 -1 -1 -1 -1 -1 0 0 0))

;; i8x16.le_u  (i8x16) (i16x8)
(assert_return (invoke "le_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i16x8 0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i16x8 65535   65535   65535   65535   65535   65535   65535   65535))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i16x8 0   0   0   0   0   0   0   0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i16x8 0x0100    0x0302    0x0504    0x0706    0x0908    0x0B0A    0x0D0C    0x0F0E))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_u" (v128.const i8x16 -128 -127 -126 -125   -3 -2 -1 0   0 1 2 127   128 253 254 255)
                              (v128.const i16x8 33152     33666       65277 255    256 32514   64896   65534))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


(assert_return (invoke "le_u" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i16x8 -128      -128         0     0       1     1       255     255))
                              (v128.const i8x16  -1 -1 -1 -1 -1 -1 -1 -1 -1 0 -1 0 -1 0 -1 0))

(assert_return (invoke "le_u" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i16x8 0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; i8x16.le_u  (i8x16) (i32x4)
(assert_return (invoke "le_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i32x4 0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i32x4 4294967295      4294967295      4294967295      4294967295))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i32x4 0  0  0  0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i32x4 0x03020100          0x07060504          0x0B0A0908          0x0F0E0D0C))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "le_u" (v128.const i8x16 -128 -127 -126 -125    -3 -2 -1 0    0 1 2 127    128 253 254 255)
                              (v128.const i32x4 2206368128             16776957      2130837760   4294901120))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


(assert_return (invoke "le_u" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i32x4 -128                   0             1             255))
                              (v128.const i8x16 -1    -1    -1   -1    -1 -1 -1 -1   -1 0 0 0      -1 0 0 0))

(assert_return (invoke "le_u" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i32x4 0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; gt_s

;; i8x16.gt_s  (i8x16) (i8x16)
;; hex vs hex
(assert_return (invoke "gt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; hex vs dec
(assert_return (invoke "gt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; dec vs dec
(assert_return (invoke "gt_s" (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 -0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; hex vs float
(assert_return (invoke "gt_s" (v128.const i8x16 0x00 0x00 0x00 0xc3 0x00 0x00 0xfe 0xc2 0x00 0x00 0x80 0xbf 0x00 0x00 0x00 0x00)
                              (v128.const f32x4 -128.0 -127.0 -1.0 0.0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0x00 0x00 0x80 0x3f 0x00 0x00 0xfe 0x42 0x00 0x00 0x00 0x43 0x00 0x00 0x7f 0x43)
                              (v128.const f32x4 1.0 127.0 128.0 255.0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; not equal
(assert_return (invoke "gt_s" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "gt_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0xFF 0xAB 0xAA 0x1B 0x1A 0x0B 0x0A 0x12 0x11 0x10 0x09 0x04 0x03 0x02 0x01 0x00))
                              (v128.const i8x16 -1 -1 -1 0 0 0 -1 0 -1 0 -1 -1 -1 0 0 0))
(assert_return (invoke "gt_s" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 0 0 0 -1 0 0 0 0 0 -1 -1 -1 0 -1 -1 -1))
(assert_return (invoke "gt_s" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 -0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 0 0 0 -1 0 0 0 0 0 -1 -1 -1 0 -1 -1 -1))

;; i8x16.gt_s  (i8x16) (i16x8)
(assert_return (invoke "gt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i16x8 0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i16x8 65535   65535   65535   65535   65535   65535   65535   65535))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i16x8 0   0   0   0   0   0   0   0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i16x8 0x0100    0x0302    0x0504    0x0706    0x0908    0x0B0A    0x0D0C    0x0F0E))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_s" (v128.const i8x16 -128 -127 -126 -125   -3 -2 -1 0   0 1 2 127   128 253 254 255)
                              (v128.const i16x8 33152     33666       65277  255   256 32514   64896   65534))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


(assert_return (invoke "gt_s" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i16x8 -128      -128         0     0       1     1       255     255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 -1 0 -1 0 0 0 0))

(assert_return (invoke "gt_s" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i16x8 0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; i8x16.gt_s  (i8x16) (i32x4)
(assert_return (invoke "gt_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i32x4 0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i32x4 4294967295      4294967295      4294967295      4294967295))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i32x4 0  0  0  0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i32x4 0x03020100          0x07060504          0x0B0A0908          0x0F0E0D0C))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_s" (v128.const i8x16 -128 -127 -126 -125    -3 -2 -1 0    0 1 2 127     128 253 254 255)
                              (v128.const i32x4 2206368128             16776957      2130837760    4294901120))
                              (v128.const i8x16  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


(assert_return (invoke "gt_s" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i32x4 -128                   0             1             255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 -1 -1 -1 0 0 0 0))

(assert_return (invoke "gt_s" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i32x4 0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; gt_u

;; i8x16.gt_u  (i8x16) (i8x16)
;; hex vs hex
(assert_return (invoke "gt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; hex vs dec
(assert_return (invoke "gt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; dec vs dec
(assert_return (invoke "gt_u" (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 -0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; hex vs float
(assert_return (invoke "gt_u" (v128.const i8x16 0x00 0x00 0x00 0xc3 0x00 0x00 0xfe 0xc2 0x00 0x00 0x80 0xbf 0x00 0x00 0x00 0x00)
                              (v128.const f32x4 -128.0 -127.0 -1.0 0.0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0x00 0x00 0x80 0x3f 0x00 0x00 0xfe 0x42 0x00 0x00 0x00 0x43 0x00 0x00 0x7f 0x43)
                              (v128.const f32x4 1.0 127.0 128.0 255.0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; not equal
(assert_return (invoke "gt_u" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "gt_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "gt_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0xFF 0xAB 0xAA 0x1B 0x1A 0x0B 0x0A 0x12 0x11 0x10 0x09 0x04 0x03 0x02 0x01 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 -1 0 -1 0 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "gt_u" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 0 0 0 -1 -1 -1 -1 0 0 0 0 0 0 -1 -1 -1))
(assert_return (invoke "gt_u" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 -0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 0 0 0 -1 -1 -1 -1 0 0 0 0 0 0 -1 -1 -1))

;; i8x16.gt_u  (i8x16) (i16x8)
(assert_return (invoke "gt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i16x8 0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i16x8 65535   65535   65535   65535   65535   65535   65535   65535))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i16x8 0   0   0   0   0   0   0   0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i16x8 0x0100    0x0302    0x0504    0x0706    0x0908    0x0B0A    0x0D0C    0x0F0E))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_u" (v128.const i8x16 -128 -127 -126 -125   -3 -2 -1 0   0 1 2 127   128 253 254 255)
                              (v128.const i16x8 33152     33666       65277  255   256 32514   64896   65534))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


(assert_return (invoke "gt_u" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i16x8 -128      -128         0     0       1     1       255     255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 -1 0 -1 0 -1 0 -1))

(assert_return (invoke "gt_u" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i16x8 0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; i8x16.gt_u  (i8x16) (i32x4)
(assert_return (invoke "gt_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i32x4 0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i32x4 4294967295      4294967295      4294967295      4294967295))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i32x4 0  0  0  0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i32x4 0x03020100          0x07060504          0x0B0A0908          0x0F0E0D0C))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

(assert_return (invoke "gt_u" (v128.const i8x16 -128 -127 -126 -125    -3 -2 -1 0    0 1 2 127     128 253 254 255)
                              (v128.const i32x4 2206368128             16776957      2130837760    4294901120))
                              (v128.const i8x16  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


(assert_return (invoke "gt_u" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i32x4 -128                   0             1             255))
                              (v128.const i8x16 0 0 0 0 0 0 0 0  0 -1 -1 -1 0 -1 -1 -1))

(assert_return (invoke "gt_u" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i32x4 0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA))
                              (v128.const i8x16  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; ge_s

;; i8x16.ge_s  (i8x16) (i8x16)
;; hex vs hex
(assert_return (invoke "ge_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; hex vs dec
(assert_return (invoke "ge_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; dec vs dec
(assert_return (invoke "ge_s" (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 -0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; hex vs float
(assert_return (invoke "ge_s" (v128.const i8x16 0x00 0x00 0x00 0xc3 0x00 0x00 0xfe 0xc2 0x00 0x00 0x80 0xbf 0x00 0x00 0x00 0x00)
                              (v128.const f32x4 -128.0 -127.0 -1.0 0.0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0x00 0x00 0x80 0x3f 0x00 0x00 0xfe 0x42 0x00 0x00 0x00 0x43 0x00 0x00 0x7f 0x43)
                              (v128.const f32x4 1.0 127.0 128.0 255.0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; not equal
(assert_return (invoke "ge_s" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 0 0 0 0 0 0 0 0))
(assert_return (invoke "ge_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0xFF 0xAB 0xAA 0x1B 0x1A 0x0B 0x0A 0x12 0x11 0x10 0x09 0x04 0x03 0x02 0x01 0x00))
                              (v128.const i8x16 -1 -1 -1 0 0 0 -1 0 -1 0 -1 -1 -1 0 0 0))
(assert_return (invoke "ge_s" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 0 0 0 -1 0 0 0 -1 -1 -1 -1 -1 0 -1 -1 -1))
(assert_return (invoke "ge_s" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 -0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 0 0 0 -1 0 0 0 -1 -1 -1 -1 -1 0 -1 -1 -1))

;; i8x16.ge_s  (i8x16) (i16x8)
(assert_return (invoke "ge_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i16x8 0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i16x8 65535   65535   65535   65535   65535   65535   65535   65535))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i16x8 0   0   0   0   0   0   0   0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i16x8 0x0100    0x0302    0x0504    0x0706    0x0908    0x0B0A    0x0D0C    0x0F0E))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_s" (v128.const i8x16 -128 -127 -126 -125   -3 -2 -1 0   0 1 2 127   128 253 254 255)
                              (v128.const i16x8 33152     33666       65277  255   256 32514   64896   65534))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


(assert_return (invoke "ge_s" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i16x8 -128      -128         0     0       1     1       255     255))
                              (v128.const i8x16 -1 0 -1 0  -1 -1 -1 -1  -1 -1 -1 -1   -1 0  -1 0))

(assert_return (invoke "ge_s" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i16x8 0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; i8x16.ge_s  (i8x16) (i32x4)
(assert_return (invoke "ge_s" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i32x4 0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_s" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i32x4 4294967295      4294967295      4294967295      4294967295))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_s" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i32x4 0  0  0  0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_s" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i32x4 0x03020100          0x07060504          0x0B0A0908          0x0F0E0D0C))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_s" (v128.const i8x16 -128 -127 -126 -125    -3 -2 -1 0    0 1 2 127    128 253 254 255)
                              (v128.const i32x4 2206368128             16776957      2130837760   4294901120))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


(assert_return (invoke "ge_s" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i32x4 -128                   0             1             255))
                              (v128.const i8x16 -1 0 0 0 -1 -1 -1 -1  -1 -1 -1 -1 -1 0 0 0))

(assert_return (invoke "ge_s" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i32x4 0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


;; ge_u

;; i8x16.ge_u  (i8x16) (i8x16)
;; hex vs hex
(assert_return (invoke "ge_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; hex vs dec
(assert_return (invoke "ge_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80 0x80)
                              (v128.const i8x16 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 -128))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; dec vs dec
(assert_return (invoke "ge_u" (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0)
                              (v128.const i8x16 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255)
                              (v128.const i8x16 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 -128 -127 -126 -125 -3 -2 -1 -0 0 1 2 127 128 253 254 255))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; hex vs float
(assert_return (invoke "ge_u" (v128.const i8x16 0x00 0x00 0x00 0xc3 0x00 0x00 0xfe 0xc2 0x00 0x00 0x80 0xbf 0x00 0x00 0x00 0x00)
                              (v128.const f32x4 -128.0 -127.0 -1.0 0.0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0x00 0x00 0x80 0x3f 0x00 0x00 0xfe 0x42 0x00 0x00 0x00 0x43 0x00 0x00 0x7f 0x43)
                              (v128.const f32x4 1.0 127.0 128.0 255.0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

;; not equal
(assert_return (invoke "ge_u" (v128.const i8x16 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F 0x0F)
                              (v128.const i8x16 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0 0xF0))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(assert_return (invoke "ge_u" (v128.const i8x16 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 0 0 -1 -1 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x09 0x10 0x11 0x12 0x0A 0x0B 0x1A 0x1B 0xAA 0xAB 0xFF)
                              (v128.const i8x16 0xFF 0xAB 0xAA 0x1B 0x1A 0x0B 0x0A 0x12 0x11 0x10 0x09 0x04 0x03 0x02 0x01 0x00))
                              (v128.const i8x16 0 0 0 0 0 0 -1 0 -1 0 -1 -1 -1 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 0x80 0x81 0x82 0x83 0xFD 0xFE 0xFF 0x00 0x00 0x01 0x02 0x7F 0x80 0xFD 0xFE 0xFF)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 0 0 0 -1 -1 -1 -1 -1 -1 0 0 0 0 -1 -1 -1))
(assert_return (invoke "ge_u" (v128.const i8x16 128 129 130 131 253 254 255 -0 0 1 2 127 128 253 254 255)
                              (v128.const i8x16 255 254 253 128 127 2 1 0 -0 -1 -2 -3 -125 -126 -127 -128))
                              (v128.const i8x16 0 0 0 -1 -1 -1 -1 -1 -1 0 0 0 0 -1 -1 -1))

;; i8x16.ge_u  (i8x16) (i16x8)
(assert_return (invoke "ge_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i16x8 0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF    0xFFFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i16x8 65535   65535   65535   65535   65535   65535   65535   65535))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i16x8 0   0   0   0   0   0   0   0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i16x8 0x0100    0x0302    0x0504    0x0706    0x0908    0x0B0A    0x0D0C    0x0F0E))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_u" (v128.const i8x16 -128 -127 -126 -125   -3 -2 -1 0   0 1 2 127   128 253 254 255)
                              (v128.const i16x8 33152     33666        65277   255     256    32514     64896   65534))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


(assert_return (invoke "ge_u" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i16x8 -128      -128         0     0       1     1       255     255))
                              (v128.const i8x16 -1 0 -1 0 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_u" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i16x8 0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA    0xAAAA))
                              (v128.const i8x16  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))

;; i8x16.ge_u  (i8x16) (i32x4)
(assert_return (invoke "ge_u" (v128.const i8x16 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF)
                              (v128.const i32x4 0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF          0xFFFFFFFF))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_u" (v128.const i8x16 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255)
                              (v128.const i32x4 4294967295      4294967295      4294967295      4294967295))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_u" (v128.const i8x16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (v128.const i32x4 0  0  0  0))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_u" (v128.const i8x16 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F)
                              (v128.const i32x4 0x03020100          0x07060504          0x0B0A0908          0x0F0E0D0C))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_u" (v128.const i8x16 -128 -127 -126 -125    -3 -2 -1 0    0 1 2 127    128 253 254 255)
                              (v128.const i32x4 2206368128             16776957      2130837760   4294901120))
                              (v128.const i8x16 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))


(assert_return (invoke "ge_u" (v128.const i8x16 -128 -128 -128 -128    0  0  0  0    1  1  1  1    255 255 255 255)
                              (v128.const i32x4 -128                   0             1             255))
                              (v128.const i8x16 -1 0 0 0 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))

(assert_return (invoke "ge_u" (v128.const i8x16 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55)
                              (v128.const i32x4 0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA          0xAAAAAAAA))
                              (v128.const i8x16  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))


;; Type check

(assert_invalid (module (func (result v128) (i8x16.eq (i32.const 0) (f32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.ge_s (i32.const 0) (f32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.ge_u (i32.const 0) (f32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.gt_s (i32.const 0) (f32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.gt_u (i32.const 0) (f32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.le_s (i32.const 0) (f32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.le_u (i32.const 0) (f32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.lt_s (i32.const 0) (f32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.lt_u (i32.const 0) (f32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.ne (i32.const 0) (f32.const 0)))) "type mismatch")


;; combination

(module (memory 1)
  (func (export "eq-in-block")
    (block
      (drop
        (block (result v128)
          (i8x16.eq
            (block (result v128) (v128.load (i32.const 0)))
            (block (result v128) (v128.load (i32.const 1)))
          )
        )
      )
    )
  )
  (func (export "ne-in-block")
    (block
      (drop
        (block (result v128)
          (i8x16.ne
            (block (result v128) (v128.load (i32.const 0)))
            (block (result v128) (v128.load (i32.const 1)))
          )
        )
      )
    )
  )
  (func (export "lt_s-in-block")
    (block
      (drop
        (block (result v128)
          (i8x16.lt_s
            (block (result v128) (v128.load (i32.const 0)))
            (block (result v128) (v128.load (i32.const 1)))
          )
        )
      )
    )
  )
  (func (export "le_u-in-block")
    (block
      (drop
        (block (result v128)
          (i8x16.le_u
            (block (result v128) (v128.load (i32.const 0)))
            (block (result v128) (v128.load (i32.const 1)))
          )
        )
      )
    )
  )
  (func (export "gt_u-in-block")
    (block
      (drop
        (block (result v128)
          (i8x16.gt_u
            (block (result v128) (v128.load (i32.const 0)))
            (block (result v128) (v128.load (i32.const 1)))
          )
        )
      )
    )
  )
  (func (export "ge_s-in-block")
    (block
      (drop
        (block (result v128)
          (i8x16.ge_s
            (block (result v128) (v128.load (i32.const 0)))
            (block (result v128) (v128.load (i32.const 1)))
          )
        )
      )
    )
  )
  (func (export "nested-eq")
    (drop
      (i8x16.eq
        (i8x16.eq
          (i8x16.eq
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.eq
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
        (i8x16.eq
          (i8x16.eq
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.eq
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
      )
    )
  )
  (func (export "nested-ne")
    (drop
      (i8x16.ne
        (i8x16.ne
          (i8x16.ne
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.ne
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
        (i8x16.ne
          (i8x16.ne
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.ne
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
      )
    )
  )
  (func (export "nested-lt_s")
    (drop
      (i8x16.lt_s
        (i8x16.lt_s
          (i8x16.lt_s
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.lt_s
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
        (i8x16.lt_s
          (i8x16.lt_s
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.lt_s
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
      )
    )
  )
  (func (export "nested-le_u")
    (drop
      (i8x16.le_u
        (i8x16.le_u
          (i8x16.le_u
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.le_u
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
        (i8x16.le_u
          (i8x16.le_u
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.le_u
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
      )
    )
  )
  (func (export "nested-gt_u")
    (drop
      (i8x16.gt_u
        (i8x16.gt_u
          (i8x16.gt_u
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.gt_u
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
        (i8x16.gt_u
          (i8x16.gt_u
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.gt_u
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
      )
    )
  )
  (func (export "nested-ge_s")
    (drop
      (i8x16.ge_s
        (i8x16.ge_s
          (i8x16.ge_s
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.ge_s
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
        (i8x16.ge_s
          (i8x16.ge_s
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.ge_s
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
      )
    )
  )
  (func (export "as-param")
    (drop
      (i8x16.ge_u
        (i8x16.eq
          (i8x16.lt_s
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.le_u
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
        (i8x16.ne
          (i8x16.gt_s
            (v128.load (i32.const 0))
            (v128.load (i32.const 1))
          )
          (i8x16.lt_u
            (v128.load (i32.const 2))
            (v128.load (i32.const 3))
          )
        )
      )
    )
  )
)

(assert_return (invoke "eq-in-block"))
(assert_return (invoke "ne-in-block"))
(assert_return (invoke "lt_s-in-block"))
(assert_return (invoke "le_u-in-block"))
(assert_return (invoke "gt_u-in-block"))
(assert_return (invoke "ge_s-in-block"))
(assert_return (invoke "nested-eq"))
(assert_return (invoke "nested-ne"))
(assert_return (invoke "nested-lt_s"))
(assert_return (invoke "nested-le_u"))
(assert_return (invoke "nested-gt_u"))
(assert_return (invoke "nested-ge_s"))
(assert_return (invoke "as-param"))
