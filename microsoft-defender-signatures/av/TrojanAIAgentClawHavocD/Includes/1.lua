-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanAIAgentClawHavocD\Includes\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:FnameAttr!skill.md") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0:find("[\\/]%.openclaw[\\/]") then
  return mp.CLEAN
end
if not l_0_0:find("[\\/]skills[\\/]") then
  return mp.CLEAN
end
return mp.INFECTED

