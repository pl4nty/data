local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = 60
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
if L2_1 ~= nil and L2_1 ~= "" and L1_1 ~= nil then
  L3_1 = L1_1.ppid
  if L3_1 ~= nil then
    L3_1 = L1_1.command_line
    if L3_1 ~= nil then
      L3_1 = L1_1.command_line
      if L3_1 ~= "" then
        goto lbl_26
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_26::
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L3_1 = L3_1()
if L3_1 ~= nil then
  L4_1 = L3_1.ppid
  if L4_1 ~= nil then
    goto lbl_37
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_37::
L4_1 = L3_1.ppid
L5_1 = ":"
L6_1 = L2_1
L7_1 = ":Known_File_Renamed"
L4_1 = L4_1 .. L5_1 .. L6_1 .. L7_1
L5_1 = IsProcessExcludedFromRansomwareAnalysis
L5_1 = L5_1()
if L5_1 == true then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = "Ransomware_Analysis_Generic.J"
L6_1 = MpCommon
L6_1 = L6_1.GetPersistContextNoPath
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 ~= nil then
  L7_1 = ipairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = string
    L12_1 = L12_1.find
    L13_1 = L1_1.ppid
    L14_1 = L11_1
    L15_1 = 1
    L16_1 = true
    L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
    if L12_1 == 1 then
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      return L12_1
    end
  end
end
L7_1 = MpCommon
L7_1 = L7_1.SetPersistContextNoPath
L8_1 = L5_1
L9_1 = {}
L10_1 = L1_1.ppid
L9_1[1] = L10_1
L10_1 = L0_1
L7_1(L8_1, L9_1, L10_1)
L7_1 = "Ransomware_Analysis_cmd_Generic.J"
L8_1 = MpCommon
L8_1 = L8_1.GetPersistContextNoPath
L9_1 = L7_1
L8_1 = L8_1(L9_1)
if L8_1 ~= nil then
  L9_1 = ipairs
  L10_1 = L8_1
  L9_1, L10_1, L11_1 = L9_1(L10_1)
  for L12_1, L13_1 in L9_1, L10_1, L11_1 do
    L14_1 = string
    L14_1 = L14_1.find
    L15_1 = L1_1.command_line
    L16_1 = L13_1
    L17_1 = 1
    L18_1 = true
    L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
    if L14_1 == 1 then
      L14_1 = mp
      L14_1 = L14_1.CLEAN
      return L14_1
    end
  end
end
L9_1 = MpCommon
L9_1 = L9_1.SetPersistContextNoPath
L10_1 = L7_1
L11_1 = {}
L12_1 = L1_1.command_line
L11_1[1] = L12_1
L12_1 = L0_1
L9_1(L10_1, L11_1, L12_1)
L9_1 = this_sigattrlog
L9_1 = L9_1[5]
L9_1 = L9_1.matched
if L9_1 then
  L9_1 = this_sigattrlog
  L9_1 = L9_1[5]
  L9_1 = L9_1.utf8p1
  if L9_1 ~= nil then
    L9_1 = this_sigattrlog
    L9_1 = L9_1[5]
    L9_1 = L9_1.utf8p2
    if L9_1 ~= nil then
      L9_1 = this_sigattrlog
      L9_1 = L9_1[5]
      L9_1 = L9_1.utf8p1
      L10_1 = this_sigattrlog
      L10_1 = L10_1[5]
      L10_1 = L10_1.utf8p2
      L12_1 = L9_1
      L11_1 = L9_1.match
      L13_1 = "[^>]*[\\/$]"
      L11_1 = L11_1(L12_1, L13_1)
      L13_1 = L10_1
      L12_1 = L10_1.match
      L14_1 = "[^>]*[\\/$]"
      L12_1 = L12_1(L13_1, L14_1)
      L14_1 = L9_1
      L13_1 = L9_1.match
      L15_1 = "%.[^/%.]+$"
      L13_1 = L13_1(L14_1, L15_1)
      L15_1 = L10_1
      L14_1 = L10_1.match
      L16_1 = "%.[^/%.]+$"
      L14_1 = L14_1(L15_1, L16_1)
      if L12_1 ~= nil and L11_1 ~= nil and L11_1 == L12_1 and L13_1 ~= nil and L14_1 ~= nil and L14_1 ~= L13_1 then
        L15_1 = isFileExtensionOfInterest
        L16_1 = L10_1
        L15_1 = L15_1(L16_1)
        if L15_1 then
          L15_1 = IsRansomwareProcessImagePathExtensionExcluded
          L16_1 = L2_1
          L17_1 = L13_1
          L15_1 = L15_1(L16_1, L17_1)
          if L15_1 == false then
            L15_1 = MpCommon
            L15_1 = L15_1.SetPersistContextNoPath
            L16_1 = L4_1
            L17_1 = {}
            L18_1 = L9_1
            L17_1[1] = L18_1
            L18_1 = L0_1
            L15_1(L16_1, L17_1, L18_1)
            L15_1 = analyzeRansomwarePattern5
            L16_1 = L4_1
            L17_1 = "FILE_RENAMED_WITH_KNOWN_EXTN"
            L15_1 = L15_1(L16_1, L17_1)
            L16_1 = mp
            L16_1 = L16_1.INFECTED
            if L15_1 == L16_1 then
              L15_1 = RemediateProcessTreeForLinux
              L15_1()
              L15_1 = mp
              L15_1 = L15_1.INFECTED
              return L15_1
            end
          end
        end
      end
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
