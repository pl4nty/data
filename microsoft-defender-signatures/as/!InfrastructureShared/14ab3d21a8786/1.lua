local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = "TamperLoaderPatch"
L1_1 = "T1562.002"
L2_1 = "ntdll.dll"
L3_1 = {}
L4_1 = "LdrLoadDll"
L3_1[1] = L4_1
L4_1 = 10
L5_1 = helper_tamperapi_setup
L6_1 = nil
L7_1 = L0_1
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
L8_1 = isnull
L9_1 = L5_1
L8_1 = L8_1(L9_1)
if not L8_1 then
  L8_1 = isnull
  L9_1 = L6_1
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    L8_1 = isnull
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if not L8_1 then
      goto lbl_30
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_30::
L8_1 = found_api_tampering
L9_1 = L5_1
L10_1 = L6_1
L11_1 = L7_1
L12_1 = L2_1
L13_1 = nil
L14_1 = L3_1
L15_1 = nil
L16_1 = L4_1
L17_1 = L0_1
L18_1 = L1_1
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
if L8_1 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
