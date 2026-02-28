local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "26190899-1602-49e8-8b27-eb1d0a1ce869"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isdamaged
if L0_1 then
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
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= "olk.exe" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSDEVICEPATH
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
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L5_1 = "\\"
L6_1 = L0_1
L4_1 = L4_1 .. L5_1 .. L6_1
L3_1 = L3_1(L4_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = MpCommon
L5_1 = L5_1.ExpandEnvironmentVariables
L6_1 = "%programfiles%"
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L5_1 = string
L5_1 = L5_1.lower
L6_1 = mp
L6_1 = L6_1.ContextualExpandEnvironmentVariables
L7_1 = "%userprofile%"
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L6_1(L7_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L6_1 = nil
if L5_1 ~= nil and L5_1 ~= "" then
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L5_1
  L9_1 = "(%a:.*\\)[^\\]+$"
  L7_1 = L7_1(L8_1, L9_1)
  L6_1 = L7_1
end
if L4_1 ~= nil and L4_1 ~= "" then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = L4_1
  L10_1 = "\\dyknow\\cloud\\[^\\]+\\olk.exe"
  L9_1 = L9_1 .. L10_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    goto lbl_162
  end
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = L4_1
  L10_1 = "\\windowsapps\\microsoft.outlookforwindows_[_%.%w]+\\olk%.exe"
  L9_1 = L9_1 .. L10_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    goto lbl_162
  end
end
if L6_1 ~= nil and L6_1 ~= "" then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = L6_1
  L10_1 = "[^\\]+\\appdata\\local\\outlook\\olk.exe"
  L9_1 = L9_1 .. L10_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    goto lbl_162
  end
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = L6_1
  L10_1 = "[^\\]+\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\olk.exe"
  L9_1 = L9_1 .. L10_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    goto lbl_162
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_162::
L7_1 = mp
L7_1 = L7_1.getfilename
L8_1 = mp
L8_1 = L8_1.FILEPATH_QUERY_FULL
L7_1 = L7_1(L8_1)
if L7_1 == nil or L7_1 == "" then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = MpCommon
L8_1 = L8_1.PathToWin32Path
L9_1 = L7_1
L8_1 = L8_1(L9_1)
L7_1 = L8_1
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
L8_1 = L8_1.IsPathExcludedForHipsRule
L9_1 = L7_1
L10_1 = "26190899-1602-49e8-8b27-eb1d0a1ce869"
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if L4_1 ~= nil and L4_1 ~= "" then
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L7_1
  L10_1 = L4_1
  L11_1 = "\\dyknow\\cloud\\[^\\]+\\%a+%.exe"
  L10_1 = L10_1 .. L11_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L7_1
  L10_1 = L4_1
  L11_1 = "[^\\]*\\microsoft\\edgewebview\\application\\%d+%.%d+%.%d+%.%d+\\msedgewebview2%.exe"
  L10_1 = L10_1 .. L11_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L7_1
  L10_1 = L4_1
  L11_1 = "[^\\]*\\microsoft\\edge beta\\application\\msedge%.exe"
  L10_1 = L10_1 .. L11_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
if L6_1 ~= nil and L6_1 ~= "" then
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L7_1
  L10_1 = L6_1
  L11_1 = "[^\\]+\\appdata\\local\\outlook\\olk%.exe"
  L10_1 = L10_1 .. L11_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L7_1
  L10_1 = L6_1
  L11_1 = "[^\\]+\\appdata\\local\\outlook\\update%.exe"
  L10_1 = L10_1 .. L11_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L7_1
  L10_1 = L6_1
  L11_1 = "[^\\]+\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\olk%.exe"
  L10_1 = L10_1 .. L11_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L7_1
  L10_1 = L6_1
  L11_1 = "[^\\]+\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\updateNativeHost%.exe"
  L10_1 = L10_1 .. L11_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L7_1
  L10_1 = L6_1
  L11_1 = "[^\\]+\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\relaunchNativeHost%.exe"
  L10_1 = L10_1 .. L11_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
