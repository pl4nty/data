-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\afd726ed3268\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
  return mp.INFECTED
end
return mp.CLEAN

