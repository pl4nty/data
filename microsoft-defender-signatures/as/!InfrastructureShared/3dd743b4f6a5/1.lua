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
    if l_0_4 ~= nil and l_0_4 ~= "" then
      return mp.INFECTED
    end
    return mp.LOWFI
  end
  return mp.CLEAN
end

