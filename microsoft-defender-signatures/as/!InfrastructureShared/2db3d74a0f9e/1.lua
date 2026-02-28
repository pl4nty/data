local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
  end
end
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.image_path
L3_1 = bm_AddRelatedFileFromCommandLine
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  if L8_1 ~= nil and L8_1 ~= "" then
    L9_1 = StringEndsWith
    L10_1 = L8_1
    L11_1 = ".cmd"
    L9_1 = L9_1(L10_1, L11_1)
    if not L9_1 then
      L9_1 = StringEndsWith
      L10_1 = L8_1
      L11_1 = ".bat"
      L9_1 = L9_1(L10_1, L11_1)
      if not L9_1 then
        goto lbl_132
      end
    end
    L10_1 = L8_1
    L9_1 = L8_1.lower
    L9_1 = L9_1(L10_1)
    L8_1 = L9_1
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = IsKeyInRollingQueue
      L10_1 = "CC_filelist"
      L11_1 = L8_1
      L12_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1)
      if L9_1 then
        L9_1 = 31536000
        L10_1 = {}
        L10_1.type = "PLCMD"
        L10_1.ProcessImagePath = L2_1
        L11_1 = this_sigattrlog
        L11_1 = L11_1[2]
        L11_1 = L11_1.ppid
        L10_1.ProcessPID = L11_1
        L10_1.ProcessCmd = L1_1
        L11_1 = this_sigattrlog
        L11_1 = L11_1[1]
        L11_1 = L11_1.ppid
        L10_1.parent = L11_1
        L10_1.score = 4
        L11_1 = AppendToRollingQueue
        L12_1 = "CC_filelist"
        L13_1 = L2_1
        L14_1 = safeJsonSerialize
        L15_1 = L10_1
        L14_1 = L14_1(L15_1)
        L15_1 = L9_1
        L16_1 = 32
        L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
        L11_1 = {}
        L12_1 = GetTrackingDataForFile
        L13_1 = L8_1
        L14_1 = L11_1
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 and L11_1 ~= nil then
          L12_1 = safeJsonSerialize
          L13_1 = L11_1
          L12_1 = L12_1(L13_1)
          L11_1 = L12_1
          L12_1 = bm
          L12_1 = L12_1.add_related_string
          L13_1 = "CC_filelist"
          L14_1 = L11_1
          L15_1 = bm
          L15_1 = L15_1.RelatedStringBMReport
          L12_1(L13_1, L14_1, L15_1)
        end
      end
    end
  end
  ::lbl_132::
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
