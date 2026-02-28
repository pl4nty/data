local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if L1_1 ~= "normal.dotm" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L2_1 = {}
L2_1["explorer.exe"] = true
L2_1["searchindexer.exe"] = true
L2_1["searchprotocolhost.exe"] = true
L2_1["searchfilterhost.exe"] = true
L3_1 = L2_1[L1_1]
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = false
L4_1 = false
L5_1 = false
L6_1 = false
L7_1 = false
L8_1 = mp
L8_1 = L8_1.get_mpattribute
L9_1 = "MHSTR:MacroInside"
L8_1 = L8_1(L9_1)
if L8_1 then
  L7_1 = true
end
if L1_1 == "winword.exe" then
  L3_1 = true
  L8_1 = mp
  L8_1 = L8_1.get_contextdata
  L9_1 = mp
  L9_1 = L9_1.CONTEXT_DATA_PROCESS_PPID
  L8_1 = L8_1(L9_1)
  L9_1 = string
  L9_1 = L9_1.lower
  L10_1 = mp
  L10_1 = L10_1.GetProcessCommandLine
  L11_1 = L8_1
  L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1(L11_1)
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
  if L9_1 ~= nil then
    L10_1 = string
    L10_1 = L10_1.len
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if 0 < L10_1 then
      L10_1 = string
      L10_1 = L10_1.find
      L11_1 = L9_1
      L12_1 = "winword.exe\"?$"
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 ~= nil then
        L5_1 = true
      else
        L10_1 = string
        L10_1 = L10_1.find
        L11_1 = L9_1
        L12_1 = "normal.dotm"
        L13_1 = 1
        L14_1 = true
        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
        if L10_1 ~= nil then
          L6_1 = true
        end
      end
    end
  end
else
  L8_1 = string
  L8_1 = L8_1.lower
  L9_1 = mp
  L9_1 = L9_1.get_contextdata
  L10_1 = mp
  L10_1 = L10_1.CONTEXT_DATA_PROCESSDEVICEPATH
  L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L9_1(L10_1)
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  L9_1 = MpCommon
  L9_1 = L9_1.PathToWin32Path
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L10_1 = "\\"
  L11_1 = L1_1
  L9_1 = L9_1 .. L10_1 .. L11_1
  L10_1 = mp
  L10_1 = L10_1.IsKnownFriendlyFile
  L11_1 = L9_1
  L12_1 = false
  L13_1 = false
  L10_1 = L10_1(L11_1, L12_1, L13_1)
  if L10_1 == true then
    L4_1 = true
  end
end
L8_1 = mp
L8_1 = L8_1.SCANREASON_ONOPEN
if L0_1 == L8_1 then
  if L3_1 == true and L6_1 == true then
    L8_1 = mp
    L8_1 = L8_1.ReportLowfi
    L9_1 = MpCommon
    L9_1 = L9_1.PathToWin32Path
    L10_1 = mp
    L10_1 = L10_1.getfilename
    L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1()
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
    L10_1 = 1441392505
    L8_1(L9_1, L10_1)
  end
elseif L3_1 == true then
  if L5_1 == true then
    if L7_1 == false then
      L8_1 = mp
      L8_1 = L8_1.ReportLowfi
      L9_1 = MpCommon
      L9_1 = L9_1.PathToWin32Path
      L10_1 = mp
      L10_1 = L10_1.getfilename
      L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1()
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
      L10_1 = 629347318
      L8_1(L9_1, L10_1)
    else
      L8_1 = mp
      L8_1 = L8_1.ReportLowfi
      L9_1 = MpCommon
      L9_1 = L9_1.PathToWin32Path
      L10_1 = mp
      L10_1 = L10_1.getfilename
      L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1()
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
      L10_1 = 1384391520
      L8_1(L9_1, L10_1)
    end
  elseif L6_1 == true then
    if L7_1 == false then
      L8_1 = mp
      L8_1 = L8_1.ReportLowfi
      L9_1 = MpCommon
      L9_1 = L9_1.PathToWin32Path
      L10_1 = mp
      L10_1 = L10_1.getfilename
      L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1()
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
      L10_1 = 3415044826
      L8_1(L9_1, L10_1)
    else
      L8_1 = mp
      L8_1 = L8_1.ReportLowfi
      L9_1 = MpCommon
      L9_1 = L9_1.PathToWin32Path
      L10_1 = mp
      L10_1 = L10_1.getfilename
      L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1()
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
      L10_1 = 3163177548
      L8_1(L9_1, L10_1)
    end
  end
elseif L4_1 == true then
  L8_1 = mp
  L8_1 = L8_1.ReportLowfi
  L9_1 = MpCommon
  L9_1 = L9_1.PathToWin32Path
  L10_1 = mp
  L10_1 = L10_1.getfilename
  L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1()
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
  L10_1 = 741695453
  L8_1(L9_1, L10_1)
else
  L8_1 = mp
  L8_1 = L8_1.ReportLowfi
  L9_1 = MpCommon
  L9_1 = L9_1.PathToWin32Path
  L10_1 = mp
  L10_1 = L10_1.getfilename
  L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1()
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
  L10_1 = 1530031947
  L8_1(L9_1, L10_1)
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
