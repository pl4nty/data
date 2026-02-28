local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = peattributes
L0_1 = L0_1.ismsil
if L0_1 == true then
  L0_1 = peattributes
  L0_1 = L0_1.isdll
  if L0_1 == true then
    L0_1 = peattributes
    L0_1 = L0_1.hasexports
    if L0_1 == false then
      goto lbl_16
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[8]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[8]
  L1_1 = L1_1.p1
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[8]
    L2_1 = L2_1.p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = contains
L2_1 = L0_1
L3_1 = "aspnet_regbrowsers"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = str_reverse
L3_1 = L0_1
L2_1 = L0_1.gsub
L4_1 = "[-,.]"
L5_1 = ""
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
L0_1 = L1_1
L1_1 = contains
L2_1 = L0_1
L3_1 = "aspnet_regbrowsers"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
