-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4cd7e328d266\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 ~= nil and l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
    local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
    if l_0_1 then
      l_0_1 = (string.lower)(l_0_1)
      if (string.find)(l_0_1, "iwr ", 1, true) and (string.find)(l_0_1, "http", 1, true) then
        return mp.INFECTED
      end
    end
  end
  return mp.CLEAN
end

