local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.InternalName
  if L1_1 ~= nil then
    L1_1 = L0_1.CompanyName
    if L1_1 ~= nil then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.LOWFI
do return L1_1 end
::lbl_15::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1.InternalName
L3_1 = "CMClient.exe"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1.InternalName
  L3_1 = "netbar's maintenance"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
