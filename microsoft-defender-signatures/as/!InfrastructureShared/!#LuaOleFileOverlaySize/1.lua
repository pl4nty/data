local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 4194304 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_mpattributevalue
L2_1 = "RPF:OleFileHasOverlay"
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 < 256 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L0_1 - L1_1
if 268435456 <= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:OLEOverlayGT256mb"
  L3_1(L4_1)
elseif 104857600 <= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:OLEOverlayGT100mb"
  L3_1(L4_1)
elseif 16777216 <= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:OLEOverlayGT16mb"
  L3_1(L4_1)
end
L3_1 = L2_1 / L1_1
if 1000 <= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:OLEOverlayGT1000xFileSize"
  L4_1(L5_1)
elseif 100 <= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:OLEOverlayGT100xFileSize"
  L4_1(L5_1)
elseif 10 <= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:OLEOverlayGT10xFileSize"
  L4_1(L5_1)
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
