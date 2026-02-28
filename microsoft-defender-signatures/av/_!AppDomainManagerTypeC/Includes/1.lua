local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "program files"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "%.exe%.config$"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      goto lbl_35
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_35::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == "c:\\windows\\microsoft.net\\framework\\v4.0.30319\\ngentask.exe.config" then
  L1_1 = mp
  L1_1 = L1_1.GetMachineGUID
  L1_1 = L1_1()
  if not L1_1 then
    L1_1 = ""
  end
  if L1_1 == "0CA8A424-55F3-D616-23EC-EEF8DB1E3F15" then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "^(.*)[/\\][^/\\]+$"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = math_min
L3_1 = 10000
L4_1 = mp
L4_1 = L4_1.getfilesize
L4_1 = L4_1()
if not L4_1 then
  L4_1 = 0
end
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = tostring
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = 0
L6_1 = L2_1
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = true
L4_1(L5_1)
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "<appDomainManagerAssembly value=\"([^\"\r\n\\,]+)"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = ".exe$"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = L4_1
  L6_1 = ".exe"
  L4_1 = L5_1 .. L6_1
end
L6_1 = L3_1
L5_1 = L3_1.match
L7_1 = "<probing privatePath=\"([^\"\r\n]+)"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = L1_1
end
L6_1 = MpCommon
L6_1 = L6_1.PathToWin32Path
L7_1 = L5_1
L8_1 = string
L8_1 = L8_1.sub
L9_1 = L5_1
L10_1 = -1
L8_1 = L8_1(L9_1, L10_1)
if L8_1 == "\\" then
  L8_1 = ""
  if L8_1 then
    goto lbl_130
  end
end
L8_1 = "\\"
::lbl_130::
L9_1 = L4_1
L7_1 = L7_1 .. L8_1 .. L9_1
L6_1 = L6_1(L7_1)
L7_1 = sysio
L7_1 = L7_1.IsFileExists
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = L1_1
  L8_1 = "\\"
  L9_1 = L4_1
  L6_1 = L7_1 .. L8_1 .. L9_1
  if L5_1 ~= L1_1 then
    L7_1 = sysio
    L7_1 = L7_1.IsFileExists
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      goto lbl_154
    end
  end
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
::lbl_154::
L7_1 = "SuspiciousAppDomainAssembly"
L8_1 = mp
L8_1 = L8_1.ReportLowfi
L9_1 = L6_1
L10_1 = 1924697406
L8_1(L9_1, L10_1)
L8_1 = mp
L8_1 = L8_1.set_mpattribute
L9_1 = string
L9_1 = L9_1.format
L10_1 = "%s!%s"
L11_1 = L7_1
L12_1 = L6_1
L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L9_1(L10_1, L11_1, L12_1)
L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L8_1 = MpCommon
L8_1 = L8_1.SetOriginalFileName
L9_1 = L6_1
L10_1 = string
L10_1 = L10_1.format
L11_1 = "BM_%s"
L12_1 = L7_1
L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L10_1(L11_1, L12_1)
L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L8_1 = mp
L8_1 = L8_1.get_contextdata
L9_1 = mp
L9_1 = L9_1.CONTEXT_DATA_PROCESS_PPID
L8_1 = L8_1(L9_1)
L9_1 = isnull
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = MpCommon
  L9_1 = L9_1.BmTriggerSig
  L10_1 = L8_1
  L11_1 = L7_1
  L12_1 = string
  L12_1 = L12_1.format
  L13_1 = "Config=%s;Assembly=%s"
  L14_1 = L0_1
  L15_1 = L6_1
  L12_1, L13_1, L14_1, L15_1 = L12_1(L13_1, L14_1, L15_1)
  L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
end
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
