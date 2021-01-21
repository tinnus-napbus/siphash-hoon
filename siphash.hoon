:: siphash-2-4
::
|%
++  siphash
|=  [k=byts m=byts]
^-  byts
?>  =(wid.k 16)
?>  (lte (met 3 dat.k) wid.k)
?>  (lte (met 3 dat.m) wid.m)
=.  k  (flim:sha k)
=.  m  (flim:sha m)
(fin (comp m (init dat.k)))
::
:: Initialise internal state
++  init
  |=  k=@
  ^-  [@ @ @ @]
  =/  k0=@  (end [6 1] k)
  =/  k1=@  (cut 6 [1 1] k)
  :^    (mix k0 0x736f.6d65.7073.6575)
      (mix k1 0x646f.7261.6e64.6f6d)
    (mix k0 0x6c79.6765.6e65.7261)
  (mix k1 0x7465.6462.7974.6573)
::
:: Compression rounds 
++  comp
  |=  [m=byts v=[v0=@ v1=@ v2=@ v3=@]]
  ^-  [@ @ @ @]
  =/  len=@ud  (div wid.m 8)
  =/  last=@  (lsh [3 7] (mod wid.m 256))
  =|  i=@ud
  =|  w=@
  |-
  =.  w  (cut 6 [i 1] dat.m)
  ?:  =(i len)
    =.  v3.v  (mix v3.v (mix last w))
    =.  v  (rnd (rnd v))
    =.  v0.v  (mix v0.v (mix last w))
    v
  %=  $
    v  =.  v3.v  (mix v3.v w)
       =.  v  (rnd (rnd v))
       =.  v0.v  (mix v0.v w)
       v
    i  (add i 1)
  ==
::
:: Finalisation rounds
++  fin
  |=  v=[v0=@ v1=@ v2=@ v3=@]
  ^-  byts
  =.  v2.v  (mix v2.v 0xff)
  =.  v  (rnd (rnd (rnd (rnd v))))
  :-  8
  :(mix v0.v v1.v v2.v v3.v)
::
:: Sipround
++  rnd
  |=  [v0=@ v1=@ v2=@ v3=@]
  ^-  [@ @ @ @]
  =.  v0  (~(sum fe 6) v0 v1)
  =.  v2  (~(sum fe 6) v2 v3)
  =.  v1  (~(rol fe 6) 0 13 v1)
  =.  v3  (~(rol fe 6) 0 16 v3)
  =.  v1  (mix v1 v0)
  =.  v3  (mix v3 v2)
  =.  v0  (~(rol fe 6) 0 32 v0)
  =.  v2  (~(sum fe 6) v2 v1)
  =.  v0  (~(sum fe 6) v0 v3)
  =.  v1  (~(rol fe 6) 0 17 v1)
  =.  v3  (~(rol fe 6) 0 21 v3)
  =.  v1  (mix v1 v2)
  =.  v3  (mix v3 v0)
  =.  v2  (~(rol fe 6) 0 32 v2)
  [v0 v1 v2 v3]
--
