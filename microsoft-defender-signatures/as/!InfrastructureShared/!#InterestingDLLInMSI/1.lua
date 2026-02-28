local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 10) then
    goto lbl_18
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_18::
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = ".msi->"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = ""
L2_1 = string
L2_1 = L2_1.gmatch
L3_1 = L0_1
L4_1 = "%.([^%.]+)->"
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
for L5_1 in L2_1, L3_1, L4_1 do
  L6_1 = L1_1
  L7_1 = L5_1
  L8_1 = "*"
  L1_1 = L6_1 .. L7_1 .. L8_1
end
L2_1 = {}
L2_1["zip*msi*"] = true
L2_1["rar*msi*"] = true
L2_1["7z*msi*"] = true
L2_1["iso*msi*"] = true
L2_1["msi*msi*"] = true
L2_1["msi*zip*"] = true
L3_1 = L2_1[L1_1]
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
