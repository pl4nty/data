local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L3_1 = 50000000
L4_1 = bm
L4_1 = L4_1.GetSignatureMatchDuration
L4_1 = L4_1()
if L3_1 < L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = this_sigattrlog
L5_1 = L5_1[22]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[22]
  L5_1 = L5_1.utf8p2
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[22]
    L0_1 = L5_1.utf8p2
    L5_1 = string
    L5_1 = L5_1.match
    L6_1 = L0_1
    L7_1 = "/([^/]+)$"
    L5_1 = L5_1(L6_1, L7_1)
    L1_1 = L5_1
    if not L1_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
  end
end
L5_1 = this_sigattrlog
L5_1 = L5_1[23]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[23]
  L5_1 = L5_1.utf8p2
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[23]
    L2_1 = L5_1.utf8p2
  end
end
if L2_1 ~= nil then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "insmod "
  L8_1 = L1_1
  L7_1 = L7_1 .. L8_1
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L2_1
    L7_1 = "insmod "
    L8_1 = L0_1
    L7_1 = L7_1 .. L8_1
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      goto lbl_83
    end
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = ".ko"
  L8_1 = -3
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
::lbl_83::
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "DroppedKernelModule"
L7_1 = L0_1
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "KernelModuleLoadCmdLine"
L7_1 = L2_1
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.ReportLowfi
L6_1 = L0_1
L7_1 = 1690978323
L5_1(L6_1, L7_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
