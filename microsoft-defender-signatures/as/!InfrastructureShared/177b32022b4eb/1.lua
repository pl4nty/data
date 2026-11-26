-- Threat: !InfrastructureShared
-- Name: 177b32022b4eb
-- Type: 21

if not this_sigattrlog[7].matched then
  return mp.CLEAN
end
if this_sigattrlog[7].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[7].utf8p1))
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
bm.add_related_string("DLL", l_0_0, bm.RelatedStringBMReport)
return mp.INFECTED
