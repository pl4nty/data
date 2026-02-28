local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.get_SMS_level
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SMS_SCAN_LOW_ADV
L3_1 = mp
L3_1 = L3_1.SMS_SCAN_LOW
L2_1 = L2_1 - L3_1
L3_1 = mp
L3_1 = L3_1.bitand
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L2_1 == L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L3_1
L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L3_1 = L4_1
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\\\puddingzip\\\\pdzipservice.exe"
L7_1 = 30
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "\\\\santivirus\\\\santivirusic.exe"
  L7_1 = 30
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "\\\\cloudvolumes\\\\agent\\\\svservice.exe"
    L7_1 = 36
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "\\\\segurazo\\\\segurazoic.exe"
      L7_1 = 26
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "\\\\thirtyseven4\\\\scsecsvc.exe"
        L7_1 = 28
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = "\\\\application manager\\\\agent\\\\amagentassist.exe"
          L7_1 = 47
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = "\\\\bitdefender\\\\tools\\\\bdantiransomware\\\\bdantiransomware.exe"
            L7_1 = 60
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              goto lbl_105
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
::lbl_105::
L4_1 = IsSenseRelatedProc
L4_1 = L4_1()
if L4_1 == true then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = TrackPidAndTechniqueBM
L5_1 = "BM"
L6_1 = "T1055.002"
L7_1 = "portable_executable_injection"
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
