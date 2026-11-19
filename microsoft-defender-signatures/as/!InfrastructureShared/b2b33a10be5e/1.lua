-- Threat: !InfrastructureShared
-- Name: b2b33a10be5e
-- Type: 21

local l_0_0 = this_sigattrlog[6].utf8p1
if sysio.IsFileExists(l_0_0) and mp.IsKnownFriendlyFile(l_0_0, false, false) == false then
  bm.add_related_file(l_0_0)
  mp.ReportLowfi(l_0_0, 1473591917)
  return mp.INFECTED
end
return mp.CLEAN
