-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25d739cbf082\1.luac 

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
if l_0_2 ~= "net.exe" then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, "%s+user%s*$") == nil then
  return mp.CLEAN
end
local l_0_4 = (mp.GetParentProcInfo)()
if l_0_4 and (string.find)((string.lower)(l_0_4.image_path), "python", 1, true) and IsProcNameInParentProcessTree("cmdhstr", "ai_exec_server.exe") then
  return mp.INFECTED
end
return mp.CLEAN

