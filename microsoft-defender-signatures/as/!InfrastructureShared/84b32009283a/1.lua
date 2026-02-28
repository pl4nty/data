local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = 0
L2_1 = {}
L3_1 = IsProcessExcludedFromRansomwareAnalysis
L3_1 = L3_1()
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
if L3_1 ~= nil then
  L4_1 = L3_1.ppid
  if L4_1 ~= nil then
    L4_1 = L3_1.command_line
    if L4_1 ~= nil then
      L4_1 = L3_1.command_line
      if L4_1 ~= "" then
        goto lbl_29
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_29::
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1.command_line
L6_1 = "/usr/bin/apt-key"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1.command_line
  L6_1 = "postgres"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1.command_line
    L6_1 = "zypper -qn refresh"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      goto lbl_59
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_59::
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
L6_1 = L3_1.ppid
L7_1 = L4_1
L8_1 = 3
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 == true then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end

function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = "/usr/bin/gpg"
  L4_2 = A0_2
  L5_2 = 1
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if L2_2 ~= 1 then
    L2_2 = string
    L2_2 = L2_2.find
    L3_2 = "/usr/bin/gpg2"
    L4_2 = A0_2
    L5_2 = 1
    L6_2 = true
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    if L2_2 ~= 1 then
      L2_2 = false
      return L2_2
    end
  end
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = A1_2
  L4_2 = "--ignore-time-conflict"
  L5_2 = 1
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if not L2_2 then
    L2_2 = string
    L2_2 = L2_2.find
    L3_2 = A1_2
    L4_2 = "--no-sk-comments"
    L5_2 = 1
    L6_2 = true
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    if not L2_2 then
      L2_2 = string
      L2_2 = L2_2.find
      L3_2 = A1_2
      L4_2 = "--enable-progress-filter"
      L5_2 = 1
      L6_2 = true
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
      if not L2_2 then
        L2_2 = string
        L2_2 = L2_2.find
        L3_2 = A1_2
        L4_2 = "--enable-special-filenames"
        L5_2 = 1
        L6_2 = true
        L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
        if not L2_2 then
          L2_2 = string
          L2_2 = L2_2.find
          L3_2 = A1_2
          L4_2 = "--check-trustdb"
          L5_2 = 1
          L6_2 = true
          L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
          if not L2_2 then
            L2_2 = string
            L2_2 = L2_2.find
            L3_2 = A1_2
            L4_2 = "--version"
            L5_2 = 1
            L6_2 = true
            L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
            if not L2_2 then
              L2_2 = string
              L2_2 = L2_2.find
              L3_2 = A1_2
              L4_2 = "--with-colons"
              L5_2 = 1
              L6_2 = true
              L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
              if not L2_2 then
                L2_2 = string
                L2_2 = L2_2.find
                L3_2 = A1_2
                L4_2 = "--decrypt"
                L5_2 = 1
                L6_2 = true
                L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
                if not L2_2 then
                  L2_2 = string
                  L2_2 = L2_2.find
                  L3_2 = A1_2
                  L4_2 = "--fingerprint"
                  L5_2 = 1
                  L6_2 = true
                  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
                  if not L2_2 then
                    goto lbl_104
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_104::
  L2_2 = true
  return L2_2
end

gpgCommandLineSanityCheck = L5_1
L5_1 = 1
L6_1 = L0_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.attribute
  L10_1 = sigattr_tail
  L10_1 = L10_1[L8_1]
  L10_1 = L10_1.utf8p1
  L11_1 = sigattr_tail
  L11_1 = L11_1[L8_1]
  L11_1 = L11_1.utf8p2
  if L9_1 == 16400 and L10_1 ~= nil and L11_1 ~= nil then
    L12_1 = L2_1[L11_1]
    if L12_1 == nil then
      L2_1[L11_1] = true
      L12_1 = gpgCommandLineSanityCheck
      L13_1 = L10_1
      L14_1 = L11_1
      L12_1 = L12_1(L13_1, L14_1)
      if L12_1 == true then
        L1_1 = L1_1 + 1
      end
    end
  end
end
if 10 <= L1_1 then
  L5_1 = addRelatedProcess
  L5_1()
  L5_1 = reportRelatedBmHits
  L5_1()
  L5_1 = TrackPidAndTechniqueBM
  L6_1 = "BM"
  L7_1 = "T1486"
  L8_1 = "Impact_GpgEncryption"
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = safeJsonSerialize
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.add_related_string
  L7_1 = "gpg_cmdline"
  L8_1 = L5_1
  L9_1 = bm
  L9_1 = L9_1.RelatedStringBMReport
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = RemediateProcessTreeForLinux
  L6_1()
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
