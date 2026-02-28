local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
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
if L1_1 ~= "msedgewebview2.exe" then
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
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if L1_1 == nil or L1_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L3_1
L7_1 = L4_1
L8_1 = "[^\\]*\\microsoft\\edgewebview\\application\\[%d%.]+\\msedgewebview2.exe"
L7_1 = L7_1 .. L8_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_PROCESS_PPID
L5_1 = L5_1(L6_1)
if L5_1 == nil or L5_1 == "" then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.lower
L7_1 = mp
L7_1 = L7_1.GetProcessCommandLine
L8_1 = L5_1
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L7_1(L8_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if L6_1 ~= nil then
  L7_1 = string
  L7_1 = L7_1.len
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 ~= 0 then
    goto lbl_146
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_146::
L7_1 = string
L7_1 = L7_1.match
L8_1 = L6_1
L9_1 = "%-%-type=([^%s]+).*%-%-webview%-exe%-name=([^%s]+)"
L7_1, L8_1 = L7_1(L8_1, L9_1)
if L7_1 == nil or L7_1 == "" then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = {}
L9_1.renderer = true
L9_1["gpu-process"] = true
L9_1.utility = true
L10_1 = L9_1[L7_1]
if L10_1 ~= true then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
if L8_1 == nil or L8_1 == "" then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = {}
L10_1["outlook.exe"] = true
L10_1["olk.exe"] = true
L11_1 = L10_1[L8_1]
if L11_1 ~= true then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = mp
L11_1 = L11_1.getfilename
L12_1 = mp
L12_1 = L12_1.bitor
L13_1 = mp
L13_1 = L13_1.FILEPATH_QUERY_FULL
L14_1 = mp
L14_1 = L14_1.FILEPATH_QUERY_LOWERCASE
L12_1, L13_1, L14_1, L15_1 = L12_1(L13_1, L14_1)
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
if L11_1 == nil or L11_1 == "" then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.lower
L13_1 = MpCommon
L13_1 = L13_1.PathToWin32Path
L14_1 = L11_1
L13_1, L14_1, L15_1 = L13_1(L14_1)
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1 = L12_1
L12_1 = mp
L12_1 = L12_1.IsPathExcludedForHipsRule
L13_1 = L11_1
L14_1 = "26190899-1602-49e8-8b27-eb1d0a1ce869"
L12_1 = L12_1(L13_1, L14_1)
if L12_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = ".:\\windows\\system32\\werfault%.exe"
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = ".:\\windows\\system32\\wermgr%.exe"
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = ".:\\windows\\syswow64\\wermgr%.exe"
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = ".:\\programdata\\app%-v\\[^\\]+\\[^\\]+\\root\\vfs\\programfilesx86\\microsoft\\edgewebview\\application\\[%d%.]+\\identity_helper%.exe"
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = L4_1
L15_1 = "[^\\]*\\microsoft\\edgewebview\\application\\[%d%.]+\\identity_helper%.exe"
L14_1 = L14_1 .. L15_1
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = L4_1
L15_1 = "[^\\]*\\sogouinput\\"
L14_1 = L14_1 .. L15_1
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = L4_1
L15_1 = "[^\\]*\\sogouwbinput\\"
L14_1 = L14_1 .. L15_1
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = L4_1
L15_1 = "[^\\]*\\tencent\\"
L14_1 = L14_1 .. L15_1
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = L4_1
L15_1 = "[^\\]*\\microsoft office\\"
L14_1 = L14_1 .. L15_1
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = L4_1
L15_1 = "[^\\]*\\adobe\\"
L14_1 = L14_1 .. L15_1
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = L4_1
L15_1 = "[^\\]*\\google\\"
L14_1 = L14_1 .. L15_1
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.find
L13_1 = L11_1
L14_1 = L4_1
L15_1 = "[^\\]*\\7%-zip\\"
L14_1 = L14_1 .. L15_1
L12_1 = L12_1(L13_1, L14_1)
if L12_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = mp
L12_1 = L12_1.INFECTED
return L12_1
