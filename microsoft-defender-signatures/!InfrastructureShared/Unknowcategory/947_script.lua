-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\947_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (string.match)(l_0_1, "\\([^\\]+)$")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if l_0_2 ~= "bcdedit.exe" and l_0_2 ~= "bootcfg.exe" then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = l_0_3.ppid
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
local l_0_5 = l_0_3.image_path
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
l_0_5 = (string.lower)(l_0_5)
local l_0_6 = (string.match)(l_0_5, "\\([^\\]+)$")
if l_0_6 == nil then
  return mp.CLEAN
end
if l_0_6 == "wmiprvse.exe" then
  return mp.INFECTED
else
  if l_0_6 == "cmd.exe" then
    local l_0_7 = (mp.GetParentProcInfo)(l_0_4)
    if l_0_7 == nil or l_0_7 == "" then
      return mp.CLEAN
    end
    local l_0_8 = l_0_7.image_path
    if l_0_8 == nil or l_0_8 == "" then
      return mp.CLEAN
    end
    l_0_8 = (string.lower)(l_0_8)
    local l_0_9 = (string.match)(l_0_8, "\\([^\\]+)$")
    if l_0_9 == nil then
      return mp.CLEAN
    end
    if l_0_9 == "wmiprvse.exe" then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

