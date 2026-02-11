-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanAIAgentClawHavocE\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:FnameAttr!_meta.json") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0:find("[\\/]%.openclaw[\\/]") then
  return mp.CLEAN
end
if not l_0_0:find("[\\/]skills[\\/]") then
  return mp.CLEAN
end
local l_0_1 = nil
l_0_1 = tostring(headerpage)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
l_0_2.owner = l_0_1:match("\"owner\"%s*:%s*\"(.-)\"")
l_0_2.slug = l_0_1:match("\"slug\"%s*:%s*\"(.-)\"")
l_0_2.displayname = l_0_1:match("\"displayname\"%s*:%s*\"(.-)\"")
if next(l_0_2) then
  (mp.SetDetectionString)(safeJsonSerialize(l_0_2))
end
return mp.INFECTED

