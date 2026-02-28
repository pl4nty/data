local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = "TamperMPOAVPatch"
L1_1 = "T1562.001"
L2_1 = "mpoav.dll"
L3_1 = {}
L4_1 = "DllGetClassObject"
L3_1[1] = L4_1
L4_1 = helper_tamperapi_setup
L5_1 = this_sigattrlog
L5_1 = L5_1[2]
L6_1 = L0_1
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
L7_1 = isnull
L8_1 = L4_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = isnull
  L8_1 = L5_1
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    L7_1 = isnull
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if not L7_1 then
      goto lbl_30
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_30::
L7_1 = found_api_tampering
L8_1 = L4_1
L9_1 = L5_1
L10_1 = L6_1
L11_1 = L2_1
L12_1 = nil
L13_1 = L3_1
L14_1 = nil
L15_1 = nil
L16_1 = L0_1
L17_1 = L1_1
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
