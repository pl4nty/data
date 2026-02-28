local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = IsLegacyOrgMachine
L0_1 = L0_1()
if not L0_1 then
  L0_1 = IsTechniqueObservedForPid
  L1_1 = "BM"
  L2_1 = "ttexclusion"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    L0_1 = IsTacticObservedForPid
    L1_1 = "BM"
    L2_1 = "ttexclusion"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      L0_1 = IsTacticObservedForPid
      L1_1 = "BM"
      L2_1 = "ttexclusion_cln"
      L0_1 = L0_1(L1_1, L2_1)
      if not L0_1 then
        goto lbl_26
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_26::
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L8_1 = {}
    L8_1["ccmexec.exe"] = true
    L8_1["gpscript.exe"] = true
    L8_1["mpcmdrun.exe"] = true
    L8_1["mssense.exe"] = true
    L8_1["senseir.exe"] = true
    L9_1 = string
    L9_1 = L9_1.lower
    L11_1 = L7_1
    L10_1 = L7_1.match
    L12_1 = "\\([^\\]+)$"
    L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1)
    L9_1 = L9_1(L10_1, L11_1, L12_1)
    L10_1 = L8_1[L9_1]
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
  end
end
L2_1 = bm
L2_1 = L2_1.GetSignatureMatchDuration
L2_1 = L2_1()
if 36000000000 < L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsDetectionThresholdMet
L3_1 = "BM"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
