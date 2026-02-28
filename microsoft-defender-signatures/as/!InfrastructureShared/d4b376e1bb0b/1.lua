local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = "TamperRPCRT4Protect"
L1_1 = "T1562.001"
L2_1 = "rpcrt4.dll"
L3_1 = {}
L3_1.FunctionBase = true
L4_1 = {}
L5_1 = "NdrClientCall3"
L4_1[1] = L5_1
L5_1 = helper_tamperapi_setup
L6_1 = this_sigattrlog
L6_1 = L6_1[2]
L7_1 = L0_1
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
L8_1 = bm
L8_1 = L8_1.add_related_string
L9_1 = string
L9_1 = L9_1.format
L10_1 = "%s_Debug"
L11_1 = L0_1
L9_1 = L9_1(L10_1, L11_1)
L10_1 = this_sigattrlog
L10_1 = L10_1[2]
L10_1 = L10_1.utf8p2
L11_1 = bm
L11_1 = L11_1.RelatedStringBMReport
L8_1(L9_1, L10_1, L11_1)
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
      goto lbl_45
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_45::
L8_1 = found_api_tampering
L9_1 = L5_1
L10_1 = L6_1
L11_1 = L7_1
L12_1 = L2_1
L13_1 = L3_1
L14_1 = L4_1
L15_1 = nil
L16_1 = nil
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
