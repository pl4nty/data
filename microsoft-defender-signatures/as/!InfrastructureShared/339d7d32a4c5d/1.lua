-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\339d7d32a4c5d\1.luac 

-- params : ...
-- function num : 0
if not IsExchangeServer() then
  return mp.CLEAN
end
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "w3wp.exe" then
    local l_0_2 = l_0_0.ppid
    if l_0_2 == "" or l_0_2 == nil then
      return mp.CLEAN
    end
    local l_0_3 = (string.lower)((mp.GetProcessCommandLine)(l_0_2))
    if not (string.find)(l_0_3, "-ap \"", 1, true) then
      TrackPidAndTechnique(l_0_2, "T1505.003", "webshell_parent", 604800)
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

