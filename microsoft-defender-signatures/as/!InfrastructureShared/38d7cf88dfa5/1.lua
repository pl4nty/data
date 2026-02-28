local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
L5_1 = "$(curl -fsSL http://"
L4_1[1] = L5_1
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
