-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\275d75020aa1b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and (string.find)((string.lower)(l_0_0.image_path), "w3wp.exe", -8, true) then
  local l_0_1 = l_0_0.ppid
  if l_0_1 == "" or l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
  if l_0_2 == "" or l_0_2 == nil then
    return mp.CLEAN
  end
  l_0_2 = (string.lower)(l_0_2)
  if (string.find)(l_0_2, "-ap \"sharepoint", 1, true) or IsSharepointServer() then
    TrackPidAndTechnique(l_0_1, "T1505.003", "webshell_parent_sp", 604800)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

