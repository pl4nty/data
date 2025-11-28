-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4dd7b9103533\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = false
  local l_0_2 = nil
  if l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
    l_0_1 = true
    l_0_2 = l_0_0.ppid
  else
    local l_0_3 = (mp.GetParentProcInfo)(l_0_0.ppid)
    if l_0_3 ~= nil and l_0_3.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_3.ppid, true) then
      l_0_1 = true
      l_0_2 = l_0_3.ppid
    end
  end
  do
    if not l_0_1 then
      return mp.CLEAN
    end
    do
      local l_0_4 = (mp.GetProcessCommandLine)(l_0_2)
      if not l_0_4 then
        return mp.CLEAN
      end
      l_0_4 = (string.lower)(l_0_4)
      if (string.find)(l_0_4, "ssh", 1, true) and (string.find)(l_0_4, " proxycommand=", 1, true) then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

