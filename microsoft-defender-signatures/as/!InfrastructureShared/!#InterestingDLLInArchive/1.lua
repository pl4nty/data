local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_HAS_MOTW_ADS
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetMOTWZone
L0_1 = L0_1()
if L0_1 < 3 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
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
    goto lbl_36
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_36::
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
L2_1["zip*"] = true
L2_1["rar*"] = true
L2_1["msi*"] = true
L2_1["iso*"] = true
L3_1 = L2_1[L1_1]
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
