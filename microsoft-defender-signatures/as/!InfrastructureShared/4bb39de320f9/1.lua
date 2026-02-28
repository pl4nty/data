local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm_AddRelatedFileFromCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  if L6_1 ~= nil and L6_1 ~= "" then
    L7_1 = StringEndsWith
    L8_1 = L6_1
    L9_1 = ".js"
    L7_1 = L7_1(L8_1, L9_1)
    if not L7_1 then
      L7_1 = StringEndsWith
      L8_1 = L6_1
      L9_1 = ".vbs"
      L7_1 = L7_1(L8_1, L9_1)
      if not L7_1 then
        goto lbl_87
      end
    end
    L8_1 = L6_1
    L7_1 = L6_1.lower
    L7_1 = L7_1(L8_1)
    L6_1 = L7_1
    L7_1 = sysio
    L7_1 = L7_1.IsFileExists
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = IsKeyInRollingQueue
      L8_1 = "CC_filelist"
      L9_1 = L6_1
      L10_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1)
      if L7_1 then
        L7_1 = {}
        L8_1 = GetTrackingDataForFile
        L9_1 = L6_1
        L10_1 = L7_1
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 and L7_1 ~= nil then
          L8_1 = safeJsonSerialize
          L9_1 = L7_1
          L8_1 = L8_1(L9_1)
          L7_1 = L8_1
          L8_1 = bm
          L8_1 = L8_1.add_related_string
          L9_1 = "CC_filelist"
          L10_1 = L7_1
          L11_1 = bm
          L11_1 = L11_1.RelatedStringBMReport
          L8_1(L9_1, L10_1, L11_1)
        end
      end
    end
  end
  ::lbl_87::
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
