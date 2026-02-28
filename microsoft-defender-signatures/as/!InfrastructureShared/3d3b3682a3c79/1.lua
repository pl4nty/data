local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
    goto lbl_20
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_20::
L3_1 = L1_1.ppid
L4_1 = ":"
L5_1 = L2_1
L6_1 = ":Known_File_Renamed"
L3_1 = L3_1 .. L4_1 .. L5_1 .. L6_1
L4_1 = IsProcessExcludedFromRansomwareAnalysis
L4_1 = L4_1()
if L4_1 == true then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = this_sigattrlog
L4_1 = L4_1[18]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[18]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[18]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[18]
      L4_1 = L4_1.utf8p1
      L5_1 = this_sigattrlog
      L5_1 = L5_1[18]
      L5_1 = L5_1.utf8p2
      L7_1 = L4_1
      L6_1 = L4_1.match
      L8_1 = "[^>]*[\\/$]"
      L6_1 = L6_1(L7_1, L8_1)
      L8_1 = L5_1
      L7_1 = L5_1.match
      L9_1 = "[^>]*[\\/$]"
      L7_1 = L7_1(L8_1, L9_1)
      L9_1 = L4_1
      L8_1 = L4_1.match
      L10_1 = "%.[^/%.]+$"
      L8_1 = L8_1(L9_1, L10_1)
      L10_1 = L5_1
      L9_1 = L5_1.match
      L11_1 = "%.[^/%.]+$"
      L9_1 = L9_1(L10_1, L11_1)
      L10_1 = CheckFileExtnIncludeProcessId
      L11_1 = L1_1.ppid
      L12_1 = L8_1
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.CLEAN
        return L10_1
      end
      if L7_1 ~= nil and L6_1 ~= nil and L6_1 == L7_1 and L8_1 ~= nil and L9_1 ~= nil and L9_1 ~= L8_1 then
        L10_1 = isFileExtensionOfInterest
        L11_1 = L5_1
        L10_1 = L10_1(L11_1)
        if L10_1 then
          L10_1 = IsRansomwareProcessImagePathExtensionExcluded
          L11_1 = L2_1
          L12_1 = L8_1
          L10_1 = L10_1(L11_1, L12_1)
          if L10_1 == false then
            L10_1 = MpCommon
            L10_1 = L10_1.SetPersistContextNoPath
            L11_1 = L3_1
            L12_1 = {}
            L13_1 = L4_1
            L12_1[1] = L13_1
            L13_1 = L0_1
            L10_1(L11_1, L12_1, L13_1)
            L10_1 = analyzeRansomwarePattern5
            L11_1 = L3_1
            L12_1 = "FILE_RENAMED_WITH_KNOWN_EXTN"
            L10_1 = L10_1(L11_1, L12_1)
            L11_1 = mp
            L11_1 = L11_1.INFECTED
            if L10_1 == L11_1 then
              L10_1 = RemediateProcessTreeForLinux
              L10_1()
              L10_1 = mp
              L10_1 = L10_1.INFECTED
              return L10_1
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
