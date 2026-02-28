local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pevars
L0_1 = L0_1.epsec
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
if L0_1 > L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pevars
L1_1 = L1_1.epsec
L0_1 = L0_1[L1_1]
L0_1 = L0_1.Characteristics
if L0_1 ~= 3758096416 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[1]
L2_1 = 64
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 64 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[1]
L2_1 = 184
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 184 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pevars
L1_1 = L1_1.epsec
L0_1 = L0_1[L1_1]
L0_1 = L0_1.NameDW
if L0_1 ~= 2019914798 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.firstsectwritable
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 <= 2 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if 5 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "ess\000kernel32.dll\000VirtualFree\000U\137\229`\139U\b\133\210t\\\003U\fR\139z\016\1392\133\255tN\133\246u\002\137\254\139M\f\001\206\001\207\139B\f\001\200\1288\000u\003@\235\248P"
L1_1.xray_type = 3
L1_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 1
L4_1 = 0
L5_1 = 512
L6_1 = 768
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
