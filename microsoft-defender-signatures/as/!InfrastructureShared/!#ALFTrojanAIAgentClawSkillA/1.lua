-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIAgentClawSkillA\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:FnameAttr!_meta.json") then
  return mp.CLEAN
end
local l_0_0 = false
local l_0_1 = (versioning.GetOrgID)()
if l_0_1 and (string.lower)(l_0_1) == "1beec53c-4b52-4aec-a1b1-716d6da36984" then
  l_0_0 = true
end
if not l_0_0 and (MpCommon.IsSampled)(10000, true, true, true) == false then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_2:find("[\\/]%.openclaw[\\/]") then
  return mp.CLEAN
end
if not l_0_2:find("[\\/]skills[\\/]") then
  return mp.CLEAN
end
local l_0_3 = nil
l_0_3 = tostring(headerpage)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
local l_0_4 = {}
l_0_4.owner = l_0_3:match("\"owner\"%s*:%s*\"(.-)\"")
l_0_4.slug = l_0_3:match("\"slug\"%s*:%s*\"(.-)\"")
l_0_4.displayname = l_0_3:match("\"displayname\"%s*:%s*\"(.-)\"")
if next(l_0_4) then
  (mp.SetDetectionString)(safeJsonSerialize(l_0_4))
end
return mp.INFECTED

