-- Threat: !InfrastructureShared
-- Name: 112b333eb05e5
-- Type: 21

if not this_sigattrlog[5].ppid then
  return mp.CLEAN
end
local l_0_0 = ""
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[4].utf8p1))
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_string("SuspSearchOrderExpl", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
