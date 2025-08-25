-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6bd70e97b896\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsTacticObservedForPid(l_0_0, "proc_search_order_hijack_c") or IsTacticObservedForParents(l_0_0, "proc_search_order_hijack_c", 3) then
  return mp.INFECTED
end
return mp.CLEAN

