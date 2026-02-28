local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
L6_1 = ":File_Changed"
L3_1 = L3_1 .. L4_1 .. L5_1 .. L6_1
L4_1 = IsProcessExcludedFromRansomwareAnalysis
L4_1 = L4_1()
if L4_1 == true then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = "/7za"
L7_1 = -4
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = "/bin/tar"
  L7_1 = -8
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_53
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_53::
L4_1 = this_sigattrlog
L4_1 = L4_1[6]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[6]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L4_1 = L4_1.utf8p1
    L5_1 = isMultiExtensionFileName
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 == false then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L6_1 = L4_1
    L5_1 = L4_1.match
    L7_1 = "%.[^/%.]+$"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 == nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L7_1 = L5_1
    L6_1 = L5_1.match
    L8_1 = "%.(%d+)$"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 == nil then
      L7_1 = L5_1
      L6_1 = L5_1.match
      L8_1 = "%.%-(%w+)$"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 == nil then
        goto lbl_95
      end
    end
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    do return L6_1 end
    ::lbl_95::
    L6_1 = CheckFileExtnIncludeProcessId
    L7_1 = L1_1.ppid
    L8_1 = L5_1
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L4_1
    L8_1 = "/miniconda/"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L4_1
      L8_1 = "/.cache/"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L4_1
        L8_1 = "/opt/splunk/"
        L9_1 = 1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if L6_1 ~= 1 then
          goto lbl_134
        end
      end
    end
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    do return L6_1 end
    ::lbl_134::
    L6_1 = isKnownFileExtension
    L7_1 = L4_1
    L6_1 = L6_1(L7_1)
    if L6_1 == false then
      L6_1 = IsRansomwareProcessImagePathExtensionExcluded
      L7_1 = L2_1
      L8_1 = L5_1
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 == false then
        L6_1 = MpCommon
        L6_1 = L6_1.SetPersistContextNoPath
        L7_1 = L3_1
        L8_1 = {}
        L9_1 = L4_1
        L8_1[1] = L9_1
        L9_1 = L0_1
        L6_1(L7_1, L8_1, L9_1)
        L6_1 = analyzeRansomwarePattern5
        L7_1 = L3_1
        L8_1 = "NEW_FILE_CREATED"
        L6_1 = L6_1(L7_1, L8_1)
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        if L6_1 == L7_1 then
          L6_1 = mp
          L6_1 = L6_1.INFECTED
          return L6_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
