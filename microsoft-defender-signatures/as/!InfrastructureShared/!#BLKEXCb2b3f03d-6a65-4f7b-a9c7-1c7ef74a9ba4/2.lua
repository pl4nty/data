local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
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
L0_1 = "enghipscpy:blockexecution:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.IsPathExcludedForHipsRule
L3_1 = L1_1
L4_1 = "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.QueryPersistContext
L3_1 = L1_1
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "MpDisableCaching"
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
else
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_DEVICE_CHARACTERISTICS
  L2_1 = L2_1(L3_1)
  L3_1 = mp
  L3_1 = L3_1.bitand
  L4_1 = L2_1
  L5_1 = 264193
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= 264193 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = MpCommon
  L3_1 = L3_1.ExpandEnvironmentVariables
  L4_1 = "%systemdrive%"
  L3_1 = L3_1(L4_1)
  if L3_1 == nil or L3_1 == "" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = "^"
  L7_1 = L3_1
  L6_1 = L6_1 .. L7_1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L2_1 = {}
L2_1["cmd.exe"] = true
L2_1["powershell.exe"] = true
L2_1["wscript.exe"] = true
L2_1["cscript.exe"] = true
L2_1["schtasks.exe"] = true
L2_1["at.exe"] = true
L2_1["bitsadmin.exe"] = true
L2_1["mshta.exe"] = true
L2_1["rundll32.exe"] = true
L2_1["regasm.exe"] = true
L2_1["regsvc.exe"] = true
L2_1["regsvr32.exe"] = true
L2_1["msbuild.exe"] = true
L2_1["certutil.exe"] = true
L2_1["installutil.exe"] = true
L2_1["msiexec.exe"] = true
L3_1 = {}
L3_1.exe = true
L3_1.msi = true
L3_1.js = true
L3_1.vbs = true
L3_1.ps1 = true
L3_1.cmd = true
L3_1.bat = true
L4_1 = mp
L4_1 = L4_1.GetLnkInfo
L4_1 = L4_1()
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = false
L6_1 = L4_1.BasePath
if L6_1 ~= nil then
  L7_1 = mp
  L7_1 = L7_1.ContextualExpandEnvironmentVariables
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L6_1 = L7_1
  if L6_1 ~= nil then
    L7_1 = MpCommon
    L7_1 = L7_1.PathToWin32Path
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    L6_1 = L7_1
    if L6_1 ~= nil then
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = L6_1
      L7_1 = L7_1(L8_1)
      L6_1 = L7_1
      L7_1 = sysio
      L7_1 = L7_1.IsFileExists
      L8_1 = L6_1
      L7_1 = L7_1(L8_1)
      if L7_1 then
        L7_1 = string
        L7_1 = L7_1.match
        L8_1 = L6_1
        L9_1 = "\\.+%.([^%.\\]+)$"
        L7_1 = L7_1(L8_1, L9_1)
        L8_1 = string
        L8_1 = L8_1.match
        L9_1 = L6_1
        L10_1 = "\\([^\\]+%.exe)$"
        L8_1 = L8_1(L9_1, L10_1)
        L8_1 = L2_1[L8_1]
        if L8_1 ~= true then
          if L7_1 == nil or L7_1 == "" then
            goto lbl_213
          end
          L8_1 = L3_1[L7_1]
          if L8_1 ~= true then
            goto lbl_213
          end
          L8_1 = mp
          L8_1 = L8_1.IsKnownFriendlyFile
          L9_1 = L6_1
          L10_1 = false
          L11_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1)
          if L8_1 then
            goto lbl_213
          end
        end
        L5_1 = true
      end
    end
  end
end
::lbl_213::
if L5_1 == false then
  L7_1 = L4_1.RelativePath
  if L7_1 == nil or L7_1 == "" then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = string
  L8_1 = L8_1.lower
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  L7_1 = L8_1
  L8_1 = mp
  L8_1 = L8_1.getfilename
  L9_1 = mp
  L9_1 = L9_1.FILEPATH_QUERY_PATH
  L8_1 = L8_1(L9_1)
  if L8_1 == nil or L8_1 == "" then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = MpCommon
  L9_1 = L9_1.PathToWin32Path
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
  if L8_1 == nil or L8_1 == "" then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = string
  L9_1 = L9_1.lower
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
  L9_1 = nil
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L7_1
  L12_1 = "^%.%.\\"
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 then
    L10_1 = L8_1
    L11_1 = "\\"
    L12_1 = L7_1
    L9_1 = L10_1 .. L11_1 .. L12_1
  else
    L10_1 = string
    L10_1 = L10_1.find
    L11_1 = L7_1
    L12_1 = "^%.\\"
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 then
      L10_1 = string
      L10_1 = L10_1.match
      L11_1 = L7_1
      L12_1 = "^%.\\(.+)$"
      L10_1 = L10_1(L11_1, L12_1)
      L7_1 = L10_1
      L10_1 = L8_1
      L11_1 = "\\"
      L12_1 = L7_1
      L9_1 = L10_1 .. L11_1 .. L12_1
    else
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
  end
  L10_1 = sysio
  L10_1 = L10_1.IsFileExists
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  if L10_1 then
    L10_1 = string
    L10_1 = L10_1.match
    L11_1 = L9_1
    L12_1 = "\\.+%.([^%.\\]+)$"
    L10_1 = L10_1(L11_1, L12_1)
    L11_1 = string
    L11_1 = L11_1.match
    L12_1 = L9_1
    L13_1 = "\\([^\\]+%.exe)$"
    L11_1 = L11_1(L12_1, L13_1)
    L11_1 = L2_1[L11_1]
    if L11_1 ~= true then
      if L10_1 == nil or L10_1 == "" then
        goto lbl_326
      end
      L11_1 = L3_1[L10_1]
      if L11_1 ~= true then
        goto lbl_326
      end
      L11_1 = mp
      L11_1 = L11_1.IsKnownFriendlyFile
      L12_1 = L9_1
      L13_1 = false
      L14_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1)
      if L11_1 then
        goto lbl_326
      end
    end
    L5_1 = true
  end
end
::lbl_326::
if L5_1 == false then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.set_mpattribute
L8_1 = "MpDisableCaching"
L7_1(L8_1)
L7_1 = MpCommon
L7_1 = L7_1.GetPersistContextCount
L8_1 = L1_1
L7_1 = L7_1(L8_1)
if L7_1 == 0 then
  L7_1 = {}
  L8_1 = table
  L8_1 = L8_1.insert
  L9_1 = L7_1
  L10_1 = L0_1
  L8_1(L9_1, L10_1)
  L8_1 = MpCommon
  L8_1 = L8_1.SetPersistContext
  L9_1 = L1_1
  L10_1 = L7_1
  L11_1 = 0
  L8_1(L9_1, L10_1, L11_1)
else
  L7_1 = MpCommon
  L7_1 = L7_1.QueryPersistContext
  L8_1 = L1_1
  L9_1 = L0_1
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L7_1 = MpCommon
    L7_1 = L7_1.AppendPersistContext
    L8_1 = L1_1
    L9_1 = L0_1
    L10_1 = 0
    L7_1(L8_1, L9_1, L10_1)
  end
end
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
