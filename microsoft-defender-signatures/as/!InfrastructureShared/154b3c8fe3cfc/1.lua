-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\154b3c8fe3cfc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or l_0_0 == "" or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_0 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and (l_0_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" or (MpCommon.IsSampled)(80000, false, false, false) ~= true) and (MpCommon.IsSampled)(4000, false, false, false) ~= true then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (string.match)(l_0_1, "\\([^\\]+)$")
if l_0_2 ~= "python.exe" and l_0_2 ~= "ai_exec_server.exe" and l_0_2 ~= "airuncommandasuser.exe" then
  return mp.CLEAN
end
if l_0_2 == "python.exe" and not IsProcNameInParentProcessTree("BM", "ai_exec_server.exe") and not IsProcNameInParentProcessTree("BM", "airuncommandasuser.exe") then
  return mp.CLEAN
end
return mp.INFECTED

