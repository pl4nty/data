local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = peattributes
L0_1 = L0_1.is_process
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L0_1.experience = true
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "(.+\\)([^\\]+)$"
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L2_1 == nil or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L3_1
L4_1 = L3_1.len
L4_1 = L4_1(L5_1)
if not (L4_1 < 24) then
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L3_1
  L6_1 = 1
  L7_1 = 7
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 ~= "nbminer" then
    goto lbl_41
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_41::
L5_1 = L2_1
L4_1 = L2_1.match
L6_1 = "(.+\\)([^\\]+)\\$"
L4_1, L5_1 = L4_1(L5_1, L6_1)
if L5_1 ~= nil then
  L6_1 = L0_1[L5_1]
  if L6_1 then
    goto lbl_52
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_52::
L7_1 = L3_1
L6_1 = L3_1.find
L8_1 = "^[a-z]+%.exe$"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 == 1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
