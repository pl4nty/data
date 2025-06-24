-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\396d7b518d3dc\1.luac 

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
if #(mp.GetProcessCommandLine)((mp.GetScannedPPID)()) > 450 then
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
l_0_7 = l_0_7(l_0_8, "[\"\'`^()+#&]", "")
l_0_1 = l_0_7
l_0_7 = string
l_0_7 = l_0_7.lower
l_0_8 = l_0_1
l_0_7 = l_0_7(l_0_8)
l_0_1 = l_0_7
l_0_7 = extract_urls
l_0_8 = l_0_1
l_0_7 = l_0_7(l_0_8)
if isnull(R9_PC127) then
  return mp.CLEAN
end
for l_0_12,i_2 in ipairs(R9_PC127) do
  if not split(i_2, "%.") then
    return mp.CLEAN
  end
  local l_0_14 = nil
  if not "." .. tostring((split(i_2, "%."))[#split(i_2, "%.")]) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC158: Confused about usage of register: R14 in 'UnsetPending'

  if isSuspTLD("." .. tostring((split(i_2, "%."))[#split(i_2, "%.")])) then
    return mp.INFECTED
  end
end
return mp.CLEAN

