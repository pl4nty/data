local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "3b576869-a4ec-4529-8536-b80a7769e899"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = false
L1_1 = {}
L1_1[".bat"] = true
L1_1[".cmd"] = true
L1_1[".hta"] = true
L1_1[".jar"] = true
L1_1[".js"] = true
L1_1[".jse"] = true
L1_1[".lnk"] = true
L1_1[".pif"] = true
L1_1[".ps1"] = true
L1_1[".psc1"] = true
L1_1[".settingcontent-ms"] = true
L1_1[".appcontent-ms"] = true
L1_1[".application"] = true
L1_1[".scr"] = true
L1_1[".sys"] = true
L1_1[".vbe"] = true
L1_1[".vbs"] = true
L1_1[".wsc"] = true
L1_1[".wsf"] = true
L1_1[".wsh"] = true
L1_1[".ocx"] = true
L1_1[".com"] = true
L1_1[".exe"] = true
L1_1[".dll"] = true
L1_1[".xll"] = true
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "(%.[^%.]+)$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L1_1[L3_1]
if L4_1 == true then
  L0_1 = true
else
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
  L4_1 = L4_1(L5_1)
  if not L4_1 or L4_1 == "" then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L6_1 = {}
  L6_1["cmd.exe"] = true
  L6_1["powershell.exe"] = true
  L7_1 = {}
  L7_1["cscript.exe"] = true
  L7_1["wscript.exe"] = true
  L8_1 = {}
  L8_1["mshta.exe"] = true
  L8_1["rundll32.exe"] = true
  L8_1["regasm.exe"] = true
  L8_1["regsvc.exe"] = true
  L8_1["regsvr32.exe"] = true
  L8_1["msbuild.exe"] = true
  L8_1["certutil.exe"] = true
  L8_1["installutil.exe"] = true
  L9_1 = L6_1[L5_1]
  if L9_1 ~= true then
    L9_1 = L7_1[L5_1]
    if L9_1 ~= true then
      L9_1 = L8_1[L5_1]
      if L9_1 ~= true then
        goto lbl_124
      end
    end
  end
  L0_1 = true
end
::lbl_124::
if L0_1 == false then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.getfilename
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FULL
L4_1 = L4_1(L5_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = MpCommon
L5_1 = L5_1.QueryPersistContext
L6_1 = L4_1
L7_1 = "DroppedByOfficeProc"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.ReportLowfi
  L6_1 = mp
  L6_1 = L6_1.getfilename
  L6_1 = L6_1()
  L7_1 = 3347840832
  L5_1(L6_1, L7_1)
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
