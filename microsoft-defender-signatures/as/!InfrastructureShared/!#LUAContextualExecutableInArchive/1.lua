-- Threat: !InfrastructureShared
-- Name: !#LUA:ContextualExecutableInArchive
-- Type: 13
-- Includes: HIPSEmailInfrastructure
-- MpAttributes: !RPF:TopLevelFile & (//Lua:ContextualDropExecutableByEmailClient.B | //Lua:ContextualDropExecutableFromWebmail.B)

if not mp.IsHipsRuleEnabled("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if string.len(l_0_0) < 4 then
  return mp.CLEAN
end
local l_0_1 = string.sub(l_0_0, -4):match("%.(%w+)$")
if l_0_1 == nil then
  return mp.CLEAN
end
if IsSuspiciousFileExt(l_0_1) then
  mp.set_mpattribute("MpDisableCaching")
  local l_0_2 = "enghipscpy:blockaccess:be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
  if not MpCommon.QueryPersistContext(mp.getfilename(), l_0_2) then
    MpCommon.AppendPersistContext(mp.getfilename(), l_0_2, 0)
  end
  mp.SetHipsRule("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550")
  return mp.BLOCKACCESS
end
return mp.CLEAN
