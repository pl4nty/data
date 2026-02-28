local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = #L3_1
  if not (L4_1 <= 10) then
    goto lbl_21
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_21::
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "echo%s+['\"]?([A-Za-z0-9/%+=]+)['\"]?"
L4_1 = L4_1(L5_1, L6_1)
L1_1 = L4_1
if L1_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.Base64Decode
L5_1 = L1_1
L4_1 = L4_1(L5_1)
L0_1 = L4_1
if L0_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L0_1
L4_1 = L0_1.lower
L4_1 = L4_1(L5_1)
L0_1 = L4_1
L4_1 = {}
L5_1 = "91.92.242.30"
L6_1 = "95.92.242.30"
L7_1 = "96.92.242.30"
L8_1 = "202.161.50.59"
L9_1 = "54.91.154.110"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L5_1 = contains
L6_1 = L0_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
