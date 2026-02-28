local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
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
L3_1 = IsProcessExcludedFromRansomwareAnalysis
L3_1 = L3_1()
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "Ransomware_Analysis_pid_Generic.E"
L4_1 = MpCommon
L4_1 = L4_1.GetPersistContextNoPath
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L5_1 = ipairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = string
    L10_1 = L10_1.find
    L11_1 = L1_1.ppid
    L12_1 = L9_1
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 == 1 then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
  end
end
L5_1 = MpCommon
L5_1 = L5_1.SetPersistContextNoPath
L6_1 = L3_1
L7_1 = {}
L8_1 = L1_1.ppid
L7_1[1] = L8_1
L8_1 = L0_1
L5_1(L6_1, L7_1, L8_1)
L5_1 = "Ransomware_Analysis_cmd_Generic.E"
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
    L13_1 = L1_1.command_line
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
L10_1 = L1_1.command_line
L9_1[1] = L10_1
L10_1 = L0_1
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.GetParentProcInfo
L7_1 = L7_1()
if L7_1 ~= nil then
  L8_1 = L7_1.ppid
  if L8_1 ~= nil then
    goto lbl_110
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_110::
L8_1 = L7_1.ppid
L9_1 = ":"
L10_1 = L2_1
L11_1 = ":File_Changed"
L8_1 = L8_1 .. L9_1 .. L10_1 .. L11_1
L9_1 = string
L9_1 = L9_1.find
L10_1 = L2_1
L11_1 = "/bin/tar"
L12_1 = -8
L13_1 = true
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = this_sigattrlog
L9_1 = L9_1[12]
L9_1 = L9_1.matched
if L9_1 then
  L9_1 = this_sigattrlog
  L9_1 = L9_1[12]
  L9_1 = L9_1.utf8p1
  if L9_1 ~= nil then
    L9_1 = this_sigattrlog
    L9_1 = L9_1[12]
    L9_1 = L9_1.utf8p1
    L10_1 = isMultiExtensionFileName
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if L10_1 == false then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
    L11_1 = L9_1
    L10_1 = L9_1.match
    L12_1 = "%.[^/%.]+$"
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 == nil then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    L11_1 = string
    L11_1 = L11_1.find
    L12_1 = L2_1
    L13_1 = "/usr/bin/gpg"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 == 1 then
      L11_1 = string
      L11_1 = L11_1.find
      L12_1 = L9_1
      L13_1 = "/trustdb.gpg"
      L14_1 = -12
      L15_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      if not L11_1 then
        L11_1 = string
        L11_1 = L11_1.find
        L12_1 = L9_1
        L13_1 = "/secring.gpg"
        L14_1 = -12
        L15_1 = true
        L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
        if not L11_1 then
          goto lbl_186
        end
      end
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    ::lbl_186::
    L12_1 = L10_1
    L11_1 = L10_1.match
    L13_1 = "%.(%d+)$"
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 == nil then
      L12_1 = L10_1
      L11_1 = L10_1.match
      L13_1 = "%.%-(%w+)$"
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 == nil then
        goto lbl_199
      end
    end
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    do return L11_1 end
    ::lbl_199::
    L11_1 = CheckFileExtnIncludeProcessId
    L12_1 = L1_1.ppid
    L13_1 = L10_1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    L11_1 = string
    L11_1 = L11_1.find
    L12_1 = L9_1
    L13_1 = "/miniconda/"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if not L11_1 then
      L11_1 = string
      L11_1 = L11_1.find
      L12_1 = L9_1
      L13_1 = "/.cache/"
      L14_1 = 1
      L15_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      if not L11_1 then
        L11_1 = string
        L11_1 = L11_1.find
        L12_1 = L9_1
        L13_1 = "backup/"
        L14_1 = 1
        L15_1 = true
        L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
        if not L11_1 then
          L11_1 = string
          L11_1 = L11_1.find
          L12_1 = L9_1
          L13_1 = "/backup"
          L14_1 = 1
          L15_1 = true
          L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
          if not L11_1 then
            L11_1 = string
            L11_1 = L11_1.find
            L12_1 = L9_1
            L13_1 = "/opt/splunk/"
            L14_1 = 1
            L15_1 = true
            L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
            if L11_1 ~= 1 then
              goto lbl_256
            end
          end
        end
      end
    end
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    do return L11_1 end
    ::lbl_256::
    L11_1 = isKnownFileExtension
    L12_1 = L9_1
    L11_1 = L11_1(L12_1)
    if L11_1 == false then
      L11_1 = IsRansomwareProcessImagePathExtensionExcluded
      L12_1 = L2_1
      L13_1 = L10_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 == false then
        L11_1 = MpCommon
        L11_1 = L11_1.SetPersistContextNoPath
        L12_1 = L8_1
        L13_1 = {}
        L14_1 = L9_1
        L13_1[1] = L14_1
        L14_1 = L0_1
        L11_1(L12_1, L13_1, L14_1)
        L11_1 = analyzeRansomwarePattern5
        L12_1 = L8_1
        L13_1 = "NEW_FILE_CREATED"
        L11_1 = L11_1(L12_1, L13_1)
        L12_1 = mp
        L12_1 = L12_1.INFECTED
        if L11_1 == L12_1 then
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
      end
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
