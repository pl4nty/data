-- Threat: !InfrastructureShared
-- Name: 32b3722f7afa
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if isnull(this_sigattrlog[1]) or isnull(this_sigattrlog[1].utf8p2) then
  return mp.CLEAN
end
bm.add_related_string("MaliciousSerializedObjectInfo", this_sigattrlog[1].utf8p2, bm.RelatedStringBMReport)
local l_0_0 = string.match(this_sigattrlog[1].utf8p2, "Path=(.-);Chain=")
if not isnull(l_0_0) then
  local l_0_1 = GetRollingQueueKeyValue("MaliciousSerializedObject", l_0_0)
  if isnull(l_0_1) then
    bm.add_related_string("MaliciousSerializedObjectFull", string.format("Error finding %s", l_0_0 or "[missing path]"), bm.RelatedStringBMReport)
  else
    bm.add_related_string("MaliciousSerializedObjectFull", l_0_1, bm.RelatedStringBMReport)
  end
end
return mp.INFECTED
