-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:AIAgent/ClawHavoc.CVT
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: Lua:JSONExt & JSON:Claw_BadSkill_VT

if not mp.get_mpattribute("Lua:FnameAttr!_meta.json") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0:find("[\\/]%.openclaw[\\/]") then
  return mp.CLEAN
end
if not l_0_0:find("[\\/]skills[\\/]") then
  return mp.CLEAN
end
local l_0_1
l_0_1 = tostring(headerpage)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {}
l_0_2.owner = l_0_1:match("\"owner\"%s*:%s*\"(.-)\"") or l_0_1:match("\"ownerid\"%s*:%s*\"(.-)\"")
l_0_2.slug = l_0_1:match("\"slug\"%s*:%s*\"(.-)\"")
l_0_2.displayname = l_0_1:match("\"displayname\"%s*:%s*\"(.-)\"")
if next(l_0_2) then
  mp.SetDetectionString(safeJsonSerialize(l_0_2))
end
return mp.INFECTED
