local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L1_1 = false
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L3_1 = L2_1
    L2_1 = L2_1.lower
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "process.*call.*create"
L5_1 = false
L2_1 = L2_1(L3_1, L4_1, L5_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "/node%s*:([^%s]+).-call create ['\"]([^\r\n]+)['\"]"
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = {}
L7_1 = "BTS FIX Gateway"
L8_1 = "besclient"
L9_1 = "epr.bat"
L10_1 = "ADSelfService Plus"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L7_1 = contains
L8_1 = L5_1
L9_1 = L6_1
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = contains
L8_1 = L5_1
L9_1 = "cmd.*/c"
L10_1 = false
L7_1 = L7_1(L8_1, L9_1, L10_1)
if L7_1 then
  L7_1 = contains
  L8_1 = L5_1
  L9_1 = {}
  L10_1 = " regsvr32"
  L11_1 = " rundll32"
  L12_1 = " wscript"
  L13_1 = " cscript"
  L14_1 = " mshta"
  L15_1 = " bitsadmin"
  L9_1[1] = L10_1
  L9_1[2] = L11_1
  L9_1[3] = L12_1
  L9_1[4] = L13_1
  L9_1[5] = L14_1
  L9_1[6] = L15_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    L1_1 = true
  end
end
if L1_1 then
  L7_1 = bm
  L7_1 = L7_1.add_related_string
  L8_1 = "WMICRemoteNode"
  L9_1 = tostring
  L10_1 = L4_1
  L9_1 = L9_1(L10_1)
  L10_1 = bm
  L10_1 = L10_1.RelatedStringBMReport
  L7_1(L8_1, L9_1, L10_1)
  L7_1 = add_parents
  L7_1()
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
