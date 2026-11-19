-- Threat: !InfrastructureShared
-- Name: d4b359e24510
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = sysio.CommandLineScan(l_0_0, 0)
if l_0_1 then
  bm.add_related_string("ScrpService_cmdline", l_0_0, bm.RelatedStringBMReport)
  bm.add_related_string("ScrpService", tostring(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED
