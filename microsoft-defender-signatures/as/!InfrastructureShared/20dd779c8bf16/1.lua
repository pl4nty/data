-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\20dd779c8bf16\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsTacticObservedForPid(l_0_0, "bas_tool_safebreach_process") or IsTacticObservedForParents(l_0_0, "bas_tool_safebreach_process", 4) then
  return mp.INFECTED
end
return mp.CLEAN

