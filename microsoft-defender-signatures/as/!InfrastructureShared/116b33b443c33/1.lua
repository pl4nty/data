-- Threat: !InfrastructureShared
-- Name: 116b33b443c33
-- Type: 21
-- Includes: BMLuaLib, Path

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
end
if isnull(l_0_0) then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContext(l_0_0, "MpNewlyCreatedHint_5m") then
  return mp.CLEAN
end
if not sysio.IsFileExists(l_0_0) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) == true then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
local l_0_1 = normalize_path(bm.get_imagepath())
if isnull(l_0_1) then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContext(l_0_1, "MpNewlyCreatedHint_5m") then
  return mp.CLEAN
end
return mp.INFECTED
