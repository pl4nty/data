local L0_1, L1_1, L2_1, L3_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= "" then
      goto lbl_19
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L0_1 = L1_1.utf8p1
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "/%.[^/]+$"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
