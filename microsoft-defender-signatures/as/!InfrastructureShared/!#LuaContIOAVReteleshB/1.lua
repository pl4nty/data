local L0_1, L1_1, L2_1, L3_1
L0_1 = pehdr
L0_1 = L0_1.DllCharacteristics
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[4]
L0_1 = L0_1.RVA
if L0_1 == 0 then
  L0_1 = pehdr
  L0_1 = L0_1.DataDirectory
  L0_1 = L0_1[4]
  L0_1 = L0_1.Size
  if L0_1 == 0 then
    goto lbl_30
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_30::
L0_1 = pehdr
L0_1 = L0_1.Machine
if L0_1 ~= 332 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.IOAVGetDownloadUrl
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.set_peattribute
L2_1 = "enable_vmm_grow"
L3_1 = true
L1_1(L2_1, L3_1)
L1_1 = pe
L1_1 = L1_1.set_peattribute
L2_1 = "deep_analysis"
L3_1 = true
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
