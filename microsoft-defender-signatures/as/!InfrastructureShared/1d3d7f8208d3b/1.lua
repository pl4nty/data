-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1d3d7f8208d3b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "edgetransport.exe" then
    local l_0_2 = l_0_0.ppid
    TrackPidAndTechnique(l_0_2, "T1505.002", "transport_parent", 28800)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

