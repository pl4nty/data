-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3dd743b4f6a5\1.luac 

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
if l_0_2 ~= "schtasks.exe" then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
do
  if l_0_3 and (string.find)((string.lower)(l_0_3.image_path), "python", 1, true) and IsProcNameInParentProcessTree("cmdhstr", "ai_exec_server.exe") then
    local l_0_4 = (versioning.GetOrgID)()
    if l_0_4 == nil or l_0_4 == "" then
      return mp.CLEAN
    end
    l_0_4 = (string.lower)(l_0_4)
    if l_0_4 == "64eacc49-6a31-42c6-9b39-c3d9148e65f4" or l_0_4 == "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" or l_0_4 == "d7c7c745-195f-4223-9c7a-99fb420fd000" and (versioning.IsSampled)(8000, false, true, true) == true then
      return mp.INFECTED
    end
    if l_0_4 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" and (versioning.IsSampled)(1000, false, true, true) == true then
      return mp.LOWFI
    end
  end
  return mp.CLEAN
end

