-- Threat: !InfrastructureShared
-- Name: c4b3dc350b6c
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
end
if isnull(l_0_0) then
  return mp.CLEAN
end
if not sysio.IsFileExists(l_0_0) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) == true then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
return mp.INFECTED
