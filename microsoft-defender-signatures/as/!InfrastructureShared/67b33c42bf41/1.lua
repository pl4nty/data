local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    L2_1 = L1_1
    L1_1 = L1_1.lower
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = contains
L2_1 = L0_1
L3_1 = "process.*call.*create"
L4_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "/node%s*:([^%s]+).-call create ['\"]([^\r\n]+)['\"]"
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = contains
L6_1 = L4_1
L7_1 = "cmd.*/c"
L8_1 = false
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 then
  L5_1 = contains
  L6_1 = L4_1
  L7_1 = {}
  L8_1 = " powershell"
  L7_1[1] = L8_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = bm
    L5_1 = L5_1.add_related_string
    L6_1 = "WMICRemoteNode"
    L7_1 = tostring
    L8_1 = L3_1
    L7_1 = L7_1(L8_1)
    L8_1 = bm
    L8_1 = L8_1.RelatedStringBMReport
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = bm
    L5_1 = L5_1.add_related_string
    L6_1 = "WmiprvseRemoteProc"
    L7_1 = L4_1
    L8_1 = bm
    L8_1 = L8_1.RelatedStringBMReport
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = add_parents
    L5_1()
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
