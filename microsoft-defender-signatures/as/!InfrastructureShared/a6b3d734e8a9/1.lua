local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = 60
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = "/usr/bin/gpg"
L4_1 = L1_1
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= 1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = "/usr/bin/gpg2"
  L4_1 = L1_1
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= 1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.ppid
  if L3_1 ~= nil then
    L3_1 = L2_1.command_line
    if L3_1 ~= nil then
      L3_1 = L2_1.command_line
      if L3_1 ~= "" then
        goto lbl_50
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_50::
L3_1 = L2_1.command_line
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "/usr/bin/apt-key"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "zypper -qn refresh"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "--ignore-time-conflict"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "--no-sk-comments"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "--enable-progress-filter"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = "--enable-special-filenames"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = "--check-trustdb"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              L4_1 = string
              L4_1 = L4_1.find
              L5_1 = L3_1
              L6_1 = "--version"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if not L4_1 then
                L4_1 = string
                L4_1 = L4_1.find
                L5_1 = L3_1
                L6_1 = "--fingerprint"
                L7_1 = 1
                L8_1 = true
                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                if not L4_1 then
                  goto lbl_135
                end
              end
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_135::
L4_1 = {}
L5_1 = {}
L6_1 = ""
L7_1 = "/usr/bin/apt-key"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = ""
L8_1 = "zypper -qn refresh"
L6_1[1] = L7_1
L6_1[2] = L8_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = checkParentCmdline
L6_1 = L2_1.ppid
L7_1 = L4_1
L8_1 = 3
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 == true then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.GetParentProcInfo
L5_1 = L5_1()
if L5_1 ~= nil then
  L6_1 = L5_1.ppid
  if L6_1 ~= nil then
    goto lbl_166
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_166::
L6_1 = L5_1.ppid
L7_1 = ":"
L8_1 = L1_1
L9_1 = ":File_Changed"
L6_1 = L6_1 .. L7_1 .. L8_1 .. L9_1
L7_1 = this_sigattrlog
L7_1 = L7_1[4]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[4]
  L7_1 = L7_1.utf8p1
  if L7_1 ~= nil then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[4]
    L7_1 = L7_1.utf8p1
    L8_1 = MpCommon
    L8_1 = L8_1.SetPersistContextNoPath
    L9_1 = L6_1
    L10_1 = {}
    L11_1 = L7_1
    L10_1[1] = L11_1
    L11_1 = L0_1
    L8_1(L9_1, L10_1, L11_1)
    L8_1 = analyzeRansomwarePattern5
    L9_1 = L6_1
    L10_1 = "NEW_FILE_CREATED"
    L8_1 = L8_1(L9_1, L10_1)
    L9_1 = mp
    L9_1 = L9_1.INFECTED
    if L8_1 == L9_1 then
      L8_1 = TrackPidAndTechniqueBM
      L9_1 = "BM"
      L10_1 = "T1486"
      L11_1 = "Impact_Encryption"
      L8_1(L9_1, L10_1, L11_1)
      L8_1 = RemediateProcessTreeForLinux
      L8_1()
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
