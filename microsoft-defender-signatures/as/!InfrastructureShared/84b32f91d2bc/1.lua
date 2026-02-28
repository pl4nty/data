local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    L2_1 = L1_1
    L1_1 = L1_1.lower
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L1_1 = L1_1.utf8p2
      L2_1 = L1_1
      L1_1 = L1_1.lower
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    end
  end
end
L1_1 = {}
L2_1 = "alexansisplugin"
L3_1 = "zzzzinvokemanagedcustomactionoutofproc"
L4_1 = "shcreatelocalserverrundll"
L5_1 = "hp deskjet 3050a j611 series"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = {}
L5_1 = "\\programdata\\"
L6_1 = "\\users\\public\\"
L7_1 = "%userprofile%"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = "(?:rundll32|regsvr32)(?:.exe)?\\s+\\w:\\\\(?:programdata|users\\\\public)\\\\[^\\\\]+\\.\\w{2,4}\\s*[,\\w$]+"
L4_1 = "(?:rundll32|regsvr32)(?:.exe)?\\s+%userprofile%\\\\[^\\\\]+\\.\\w{2,4}\\s*[,\\w$]+"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = false
L4_1 = ipairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = MpCommon
  L9_1 = L9_1.StringRegExpSearch
  L10_1 = L8_1
  L11_1 = L0_1
  L9_1, L10_1 = L9_1(L10_1, L11_1)
  L7_1 = L10_1
  L3_1 = L9_1
  if L3_1 then
    L9_1 = reportRelatedBmHits
    L9_1()
    L9_1 = bm
    L9_1 = L9_1.get_current_process_startup_info
    L9_1 = L9_1()
    if L9_1 then
      L10_1 = L9_1.ppid
      if L10_1 then
        L10_1 = bm
        L10_1 = L10_1.request_SMS
        L11_1 = L9_1.ppid
        L12_1 = "H"
        L10_1(L11_1, L12_1)
        L10_1 = bm
        L10_1 = L10_1.add_action
        L11_1 = "SmsAsyncScanEvent"
        L12_1 = 1
        L10_1(L11_1, L12_1)
      end
    end
    L10_1 = extractDllForRegproc
    L11_1 = L0_1
    L10_1 = L10_1(L11_1)
    if L10_1 then
      L11_1 = checkFileLastWriteTime
      L12_1 = L10_1
      L13_1 = 3600
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 == false then
        L11_1 = mp
        L11_1 = L11_1.IsKnownFriendlyFile
        L12_1 = L10_1
        L13_1 = true
        L14_1 = false
        L11_1 = L11_1(L12_1, L13_1, L14_1)
        if L11_1 == false then
          L11_1 = bm
          L11_1 = L11_1.add_threat_file
          L12_1 = L10_1
          L11_1(L12_1)
        end
      end
    end
    L11_1 = mp
    L11_1 = L11_1.INFECTED
    return L11_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
