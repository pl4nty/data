-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1dad75d344350\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
if (mp.GetParentProcInfo)() == nil or ((mp.GetParentProcInfo)()).image_path == nil then
  return mp.CLEAN
end
local l_0_2 = nil
if ((string.lower)(((mp.GetParentProcInfo)()).image_path)):match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_3 = nil
if (mp.GetScannedPPID)() == "" or (mp.GetScannedPPID)() == nil then
  return mp.CLEAN
end
local l_0_4 = nil
if not (mp.GetProcessCommandLine)((mp.GetScannedPPID)()) then
  return mp.CLEAN
end
if #(mp.GetProcessCommandLine)((mp.GetScannedPPID)()) < 50 then
  return mp.CLEAN
end
local l_0_5 = nil
if not (MpCommon.GetImagePathFromPid)(l_0_4) then
  return mp.CLEAN
end
local l_0_6 = nil
local l_0_7 = contains
local l_0_8 = l_0_6
l_0_7 = l_0_7(l_0_8, {"powershell.exe", "cmd.exe", "mshta.exe", "curl.exe", "msiexec.exe", "conhost.exe"})
if not l_0_7 then
  l_0_7 = mp
  l_0_7 = l_0_7.CLEAN
  return l_0_7
end
l_0_7 = contains
l_0_8 = l_0_6
l_0_7 = l_0_7(l_0_8, "powershell.exe")
if not l_0_7 then
  l_0_7 = contains
  l_0_8 = l_0_5
  l_0_7 = l_0_7(l_0_8, "powershell")
end
if l_0_7 then
  l_0_7 = NormalizeCmdline
  l_0_8 = "powershell"
  l_0_7 = l_0_7(l_0_8, l_0_5)
  l_0_1 = l_0_7
else
  l_0_7 = NormalizeCmdline
  l_0_8 = "cmd"
  l_0_7 = l_0_7(l_0_8, l_0_5)
  l_0_1 = l_0_7
end
l_0_7 = isnull
l_0_8 = l_0_1
l_0_7 = l_0_7(l_0_8)
if l_0_7 then
  l_0_7 = mp
  l_0_7 = l_0_7.CLEAN
  return l_0_7
end
l_0_7 = string
l_0_7 = l_0_7.gsub
l_0_8 = l_0_1
l_0_7 = l_0_7(l_0_8, "[\"\'()+]", "")
l_0_1 = l_0_7
l_0_7 = string
l_0_7 = l_0_7.lower
l_0_8 = l_0_1
l_0_7 = l_0_7(l_0_8)
l_0_1 = l_0_7
l_0_7 = MpCommon
l_0_7 = l_0_7.StringRegExpSearch
l_0_8 = "(ht?tps?:\\/\\/[^^\\s\\x22\\x27\\x7C\\x29\\x3B\\x3E\\x3C\\x2C\\x5E\\x60\\x5D\\x7D]+)"
l_0_7 = l_0_7(l_0_8, l_0_1)
if not l_0_7 then
  return mp.CLEAN
end
if not l_0_8 then
  return mp.CLEAN
end
if ExtractPartsFromUri(R9_PC133) == "" or ExtractPartsFromUri(R9_PC133) == nil then
  R9_PC133 = mp
  R9_PC133 = R9_PC133.CLEAN
  return R9_PC133
end
R9_PC133 = (ExtractPartsFromUri(R9_PC133)).host
if R9_PC133 ~= "" then
  R9_PC133 = (ExtractPartsFromUri(R9_PC133)).host
end
if R9_PC133 == nil then
  R9_PC133 = mp
  R9_PC133 = R9_PC133.CLEAN
  return R9_PC133
end
R9_PC133 = split
R9_PC133 = R9_PC133((ExtractPartsFromUri(R9_PC133)).host, "%.")
local l_0_9 = nil
if not R9_PC133 then
  return mp.CLEAN
end
local l_0_10 = nil
if not "." .. tostring(R9_PC133[#R9_PC133]) then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC170: Confused about usage of register: R10 in 'UnsetPending'

if "." .. tostring(R9_PC133[#R9_PC133]) == ".ru" then
  return mp.LOWFI
end
-- DECOMPILER ERROR at PC176: Confused about usage of register: R10 in 'UnsetPending'

if isSuspTLD("." .. tostring(R9_PC133[#R9_PC133])) then
  return mp.INFECTED
end
return mp.CLEAN

