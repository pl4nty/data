-- Threat: !InfrastructureShared
-- Name: d1b3aafa6035
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[4].utf8p1))
end
bm.add_related_string("CVE-2025-59489", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
