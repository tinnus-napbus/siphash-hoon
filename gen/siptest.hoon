:: test the siphash library
/+  *siphash
::
:-  %say
|=  *
:-  %noun
=<
^-  tape
=/  results
(skip vectors test)
?~  results
  "all 64 tests passed"
"{(scow %ud (lent results))} tests failed"
|%
:: Call siphash with test bytestring and compare results
++  test
  |=  [num=@ud hash=@]
  ?:  =(hash +:(siphash k (ranger num)))
    %.y
  %.n
::
:: generate bytestring like 0x0001020304[...]
:: with length = test number
++  ranger
  |=  num=@ud
  =|  m=@
  =|  inc=@ud
  |-  ^-  byts
  ?:  =(inc num)
    [num m]
  $(m (cat 3 inc m), inc (add inc 1))
::
:: key for testing    
++  k  [16 0x1.0203.0405.0607.0809.0a0b.0c0d.0e0f]
:: list of hashes for comparison
++  vectors  
  ^-  (list [@ud @])
  :~  [0 0x310e.0edd.47db.6f72]
      [1 0xfd67.dc93.c539.f874]
      [2 0x5a4f.a9d9.0980.6c0d]
      [3 0x2d7e.fbd7.9666.6785]
      [4 0xb787.7127.e094.27cf]
      [5 0x8da6.99cd.6455.7618]
      [6 0xcee3.fe58.6e46.c9cb]
      [7 0x37d1.018b.f500.02ab]
      [8 0x6224.939a.79f5.f593]
      [9 0xb0e4.a90b.df82.009e]
      [10 0xf3b9.dd94.c5bb.5d7a]
      [11 0xa7ad.6b22.462f.b3f4]
      [12 0xfbe5.0e86.bc8f.1e75]
      [13 0x903d.84c0.2756.ea14]
      [14 0xeef2.7a8e.90ca.23f7]
      [15 0xe545.be49.61ca.29a1]
      [16 0xdb9b.c257.7fcc.2a3f]
      [17 0x9447.be2c.f5e9.9a69]
      [18 0x9cd3.8d96.f0b3.c14b]
      [19 0xbd61.79a7.1dc9.6dbb]
      [20 0x98ee.a21a.f25c.d6be]
      [21 0xc767.3b2e.b0cb.f2d0]
      [22 0x883e.a3e3.9567.5393]
      [23 0xc8ce.5ccd.8c03.0ca8]
      [24 0x94af.49f6.c650.adb8]
      [25 0xeab8.858a.de92.e1bc]
      [26 0xf315.bb5b.b835.d817]
      [27 0xadcf.6b07.6361.2e2f]
      [28 0xa5c9.1da7.acaa.4dde]
      [29 0x7165.9587.6650.a2a6]
      [30 0x28ef.495c.53a3.87ad]
      [31 0x42c3.41d8.fa92.d832]
      [32 0xce7c.f272.2f51.2771]
      [33 0xe378.59f9.4623.f3a7]
      [34 0x3812.05bb.1ab0.e012]
      [35 0xae97.a10f.d434.e015]
      [36 0xb4a3.1508.beff.4d31]
      [37 0x8139.6229.f090.7902]
      [38 0x4d0c.f49e.e5d4.dcca]
      [39 0x5c73.336a.76d8.bf9a]
      [40 0xd0a7.0453.6ba9.3e0e]
      [41 0x9259.58fc.d642.0cad]
      [42 0xa915.c29b.c806.7318]
      [43 0x952b.79f3.bc0a.a6d4]
      [44 0xf21d.f2e4.1d45.35f9]
      [45 0x8757.7519.048f.53a9]
      [46 0x10a5.6cf5.dfcd.9adb]
      [47 0xeb75.095c.cd98.6cd0]
      [48 0x51a9.cb9e.cba3.12e6]
      [49 0x96af.adfc.2ce6.66c7]
      [50 0x72fe.5297.5a43.64ee]
      [51 0x5a16.45b2.76d5.92a1]
      [52 0xb274.cb8e.bf87.870a]
      [53 0x6f9b.b420.3de7.b381]
      [54 0xeaec.b2a3.0b22.a87f]
      [55 0x9924.a43c.c131.5724]
      [56 0xbd83.8d3a.afbf.8db7]
      [57 0xb1a.2a32.65d5.1aea]
      [58 0x1350.79a3.231c.e660]
      [59 0x932b.2846.e4d7.0666]
      [60 0xe191.5f5c.b1ec.a46c]
      [61 0xf325.965c.a16d.629f]
      [62 0x575f.f28e.6038.1be5]
      [63 0x7245.06eb.4c32.8a95]
  ==
--
