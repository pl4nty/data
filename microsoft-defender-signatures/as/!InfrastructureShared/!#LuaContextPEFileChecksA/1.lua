local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = pehdr
if L0_1 ~= nil then
  L0_1 = pehdr
  L0_1 = L0_1.NumberOfSections
  if L0_1 ~= nil then
    L0_1 = pesecs
    if L0_1 ~= nil then
      goto lbl_14
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_14::
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
L1_1 = pesecs
L1_1 = L1_1[L0_1]
L1_1 = L1_1.PointerToRawData
L2_1 = pesecs
L2_1 = L2_1[L0_1]
L2_1 = L2_1.SizeOfRawData
L1_1 = L1_1 + L2_1
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L1_1 > L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/PeFileTruncated.A!lastsection"
  L3_1(L4_1)
end
if 1 < L0_1 then
  L3_1 = pesecs
  L4_1 = L0_1 - 1
  L3_1 = L3_1[L4_1]
  L3_1 = L3_1.PointerToRawData
  L4_1 = pesecs
  L5_1 = L0_1 - 1
  L4_1 = L4_1[L5_1]
  L4_1 = L4_1.SizeOfRawData
  L3_1 = L3_1 + L4_1
  if L3_1 ~= nil and L2_1 < L3_1 then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:Context/PeFileTruncated.A!secondlastsection"
    L4_1(L5_1)
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
