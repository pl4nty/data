local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      goto lbl_19
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_19::
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p1
L1_1 = {}
L2_1 = "/private/tmp/"
L3_1 = "/users/shared/"
L4_1 = "/library/caches/"
L5_1 = "/var/tmp/"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = StringStartsWith
  L8_1 = string
  L8_1 = L8_1.lower
  L9_1 = L0_1
  L8_1 = L8_1(L9_1)
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
