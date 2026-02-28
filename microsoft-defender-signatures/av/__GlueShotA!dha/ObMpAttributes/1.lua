local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.OriginalFilename
  if L1_1 ~= nil then
    L1_1 = L0_1.OriginalFilename
    L2_1 = L1_1
    L1_1 = L1_1.find
    L3_1 = "sumburv"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 ~= nil then
      goto lbl_20
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  do return L1_1 end
  ::lbl_20::
  L1_1 = L0_1.CompanyName
  if L1_1 ~= nil then
    L1_1 = L0_1.CompanyName
    if L1_1 == "ESET North America" then
      goto lbl_29
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  do return L1_1 end
  ::lbl_29::
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
