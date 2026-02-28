local L0_1, L1_1
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.AddressOfEntryPoint
  if not (L0_1 < L1_1) then
    L0_1 = hstrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.VA
    L1_1 = pehdr
    L1_1 = L1_1.AddressOfEntryPoint
    L1_1 = L1_1 + 80
    if not (L0_1 > L1_1) then
      goto lbl_24
    end
  end
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
::lbl_24::
L0_1 = hstrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.AddressOfEntryPoint
  if not (L0_1 < L1_1) then
    L0_1 = hstrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.VA
    L1_1 = pehdr
    L1_1 = L1_1.AddressOfEntryPoint
    L1_1 = L1_1 + 80
    if not (L0_1 > L1_1) then
      goto lbl_47
    end
  end
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
::lbl_47::
L0_1 = hstrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.AddressOfEntryPoint
  if not (L0_1 < L1_1) then
    L0_1 = hstrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.VA
    L1_1 = pehdr
    L1_1 = L1_1.AddressOfEntryPoint
    L1_1 = L1_1 + 80
    if not (L0_1 > L1_1) then
      goto lbl_70
    end
  end
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
::lbl_70::
L0_1 = hstrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.AddressOfEntryPoint
  if not (L0_1 < L1_1) then
    L0_1 = hstrlog
    L0_1 = L0_1[4]
    L0_1 = L0_1.VA
    L1_1 = pehdr
    L1_1 = L1_1.AddressOfEntryPoint
    L1_1 = L1_1 + 80
    if not (L0_1 > L1_1) then
      goto lbl_93
    end
  end
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
::lbl_93::
L0_1 = hstrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.AddressOfEntryPoint
  if not (L0_1 < L1_1) then
    L0_1 = hstrlog
    L0_1 = L0_1[5]
    L0_1 = L0_1.VA
    L1_1 = pehdr
    L1_1 = L1_1.AddressOfEntryPoint
    L1_1 = L1_1 + 80
    if not (L0_1 > L1_1) then
      goto lbl_116
    end
  end
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
::lbl_116::
L0_1 = hstrlog
L0_1 = L0_1[6]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[6]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.AddressOfEntryPoint
  if not (L0_1 < L1_1) then
    L0_1 = hstrlog
    L0_1 = L0_1[6]
    L0_1 = L0_1.VA
    L1_1 = pehdr
    L1_1 = L1_1.AddressOfEntryPoint
    L1_1 = L1_1 + 80
    if not (L0_1 > L1_1) then
      goto lbl_139
    end
  end
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
::lbl_139::
L0_1 = hstrlog
L0_1 = L0_1[7]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[7]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.AddressOfEntryPoint
  if not (L0_1 < L1_1) then
    L0_1 = hstrlog
    L0_1 = L0_1[7]
    L0_1 = L0_1.VA
    L1_1 = pehdr
    L1_1 = L1_1.AddressOfEntryPoint
    L1_1 = L1_1 + 80
    if not (L0_1 > L1_1) then
      goto lbl_162
    end
  end
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
::lbl_162::
L0_1 = hstrlog
L0_1 = L0_1[8]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[8]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.AddressOfEntryPoint
  if not (L0_1 < L1_1) then
    L0_1 = hstrlog
    L0_1 = L0_1[8]
    L0_1 = L0_1.VA
    L1_1 = pehdr
    L1_1 = L1_1.AddressOfEntryPoint
    L1_1 = L1_1 + 80
    if not (L0_1 > L1_1) then
      goto lbl_185
    end
  end
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
::lbl_185::
L0_1 = hstrlog
L0_1 = L0_1[9]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[9]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.AddressOfEntryPoint
  if not (L0_1 < L1_1) then
    L0_1 = hstrlog
    L0_1 = L0_1[9]
    L0_1 = L0_1.VA
    L1_1 = pehdr
    L1_1 = L1_1.AddressOfEntryPoint
    L1_1 = L1_1 + 80
    if not (L0_1 > L1_1) then
      goto lbl_208
    end
  end
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
::lbl_208::
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
