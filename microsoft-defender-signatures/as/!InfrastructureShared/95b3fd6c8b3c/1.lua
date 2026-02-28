local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = "TamperETWPatch"
L1_1 = "T1562.002"
L2_1 = "advapi32.dll"
L3_1 = {}
L4_1 = "EventWrite"
L3_1[1] = L4_1
L4_1 = {}
L4_1.BadInstruction = true
L4_1.KnownBad = true
L4_1.FunctionBase = true
L5_1 = 10
L6_1 = helper_tamperapi_setup
L7_1 = nil
L8_1 = L0_1
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
L9_1 = isnull
L10_1 = L6_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = isnull
  L10_1 = L7_1
  L9_1 = L9_1(L10_1)
  if not L9_1 then
    L9_1 = isnull
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if not L9_1 then
      goto lbl_34
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_34::
L9_1 = found_api_tampering
L10_1 = L6_1
L11_1 = L7_1
L12_1 = L8_1
L13_1 = L2_1
L14_1 = L4_1
L15_1 = L3_1
L16_1 = nil
L17_1 = L5_1
L18_1 = L0_1
L19_1 = L1_1
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
