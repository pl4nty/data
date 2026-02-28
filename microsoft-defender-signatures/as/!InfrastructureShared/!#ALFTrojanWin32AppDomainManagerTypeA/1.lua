local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -11
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == ".exe.config" then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "program files"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    goto lbl_37
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_37::
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 10000 < L1_1 then
  L1_1 = 10000
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = tostring
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = 0
L5_1 = L1_1
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = true
L3_1(L4_1)
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "<appDomainManagerAssembly value=\"([^\"\r\n\\,]+)"
L3_1 = L3_1(L4_1, L5_1)
L5_1 = L2_1
L4_1 = L2_1.match
L6_1 = "<probing privatePath=\"([^\"\r\n]+)"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = nil
L6_1 = string
L6_1 = L6_1.sub
L7_1 = L3_1
L8_1 = -4
L6_1 = L6_1(L7_1, L8_1)
if L6_1 ~= ".dll" then
  L6_1 = L3_1
  L7_1 = ".dll"
  L3_1 = L6_1 .. L7_1
end
if not L4_1 or L4_1 == "" then
  L7_1 = L0_1
  L6_1 = L0_1.match
  L8_1 = "^(.*)[/\\][^/\\]+$"
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = L6_1
  L8_1 = "\\"
  L9_1 = L3_1
  L5_1 = L7_1 .. L8_1 .. L9_1
else
  L6_1 = string
  L6_1 = L6_1.sub
  L7_1 = L4_1
  L8_1 = -1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == "\\" then
    L6_1 = L4_1
    L7_1 = L3_1
    L5_1 = L6_1 .. L7_1
  else
    L6_1 = L4_1
    L7_1 = "\\"
    L8_1 = L3_1
    L5_1 = L6_1 .. L7_1 .. L8_1
  end
end
L6_1 = sysio
L6_1 = L6_1.IsFileExists
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.ReportLowfi
  L7_1 = L5_1
  L8_1 = 1924697406
  L6_1(L7_1, L8_1)
  L6_1 = "SuspiciousAppDomainAssembly"
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = string
  L8_1 = L8_1.format
  L9_1 = "%s!%s"
  L10_1 = L6_1
  L11_1 = L5_1
  L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L8_1(L9_1, L10_1, L11_1)
  L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  L7_1 = mp
  L7_1 = L7_1.get_contextdata
  L8_1 = mp
  L8_1 = L8_1.CONTEXT_DATA_PROCESS_PPID
  L7_1 = L7_1(L8_1)
  L8_1 = isnull
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    L8_1 = MpCommon
    L8_1 = L8_1.BmTriggerSig
    L9_1 = L7_1
    L10_1 = L6_1
    L11_1 = string
    L11_1 = L11_1.format
    L12_1 = "Config=%s;Assembly=%s"
    L13_1 = L0_1
    L14_1 = L5_1
    L11_1, L12_1, L13_1, L14_1 = L11_1(L12_1, L13_1, L14_1)
    L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  end
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
