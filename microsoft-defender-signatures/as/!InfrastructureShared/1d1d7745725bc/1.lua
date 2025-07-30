-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1d1d7745725bc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  if l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
    return mp.INFECTED
  end
  local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
  if l_0_1 ~= nil and l_0_1.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_1.ppid, true) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

