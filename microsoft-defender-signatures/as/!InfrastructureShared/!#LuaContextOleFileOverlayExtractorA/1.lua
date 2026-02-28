local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:OleFileHasOverlay"
L0_1 = L0_1(L1_1)
if L0_1 == nil or L0_1 <= 80 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = false
L2_1 = mp
L2_1 = L2_1.GetCertificateInfo
L2_1 = L2_1()
L3_1 = pairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = L7_1.Signers
  if L8_1 ~= nil then
    L1_1 = true
    break
  end
end
if L1_1 == false then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:OleFileOverlayNoCert.A"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
if L3_1 == nil or L0_1 >= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1 - L0_1
if L4_1 <= 5120000 then
  L5_1 = mp
  L5_1 = L5_1.vfo_add_filechunk
  L6_1 = L0_1
  L7_1 = L4_1
  L8_1 = "[OleFileOverlay]"
  L9_1 = 1
  L5_1(L6_1, L7_1, L8_1, L9_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
else
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:OleFileOverlayOverSizeLimit.A"
  L5_1(L6_1)
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
