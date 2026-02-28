local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = false
L1_1 = mp
L1_1 = L1_1.GetCertificateInfo
L1_1 = L1_1()
L2_1 = pairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.Signers
  if L7_1 ~= nil then
    L0_1 = true
    break
  end
end
if L0_1 == true then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:OleFileHasCertificate"
  L2_1(L3_1)
elseif L0_1 == false then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:OleFileHasNoCertificate"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
