local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.executes_from_dynamic_memory
if L0_1 then
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if 2031616 < L0_1 then
    L0_1 = pehdr
    L0_1 = L0_1.SizeOfImage
    if L0_1 < 2097152 then
      goto lbl_21
    end
  end
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if 2359296 < L0_1 then
    L0_1 = pehdr
    L0_1 = L0_1.SizeOfImage
    ::lbl_21::
    if L0_1 < 2539520 then
      L0_1 = mp
      L0_1 = L0_1.changedetectionname
      L1_1 = 805306373
      L0_1(L1_1)
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if 5111808 < L0_1 then
    L0_1 = pehdr
    L0_1 = L0_1.SizeOfImage
    if L0_1 < 5177344 then
      goto lbl_52
    end
  end
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if 4849664 < L0_1 then
    L0_1 = pehdr
    L0_1 = L0_1.SizeOfImage
    if L0_1 < 4857856 then
      goto lbl_52
    end
  end
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if 5308416 < L0_1 then
    L0_1 = pehdr
    L0_1 = L0_1.SizeOfImage
    ::lbl_52::
    if L0_1 < 5373952 then
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
  L0_1 = mp
  L0_1 = L0_1.changedetectionname
  L1_1 = 805306374
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.SUSPICIOUS
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if L0_1 == 6 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "Obfuscator_LowFi"
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
