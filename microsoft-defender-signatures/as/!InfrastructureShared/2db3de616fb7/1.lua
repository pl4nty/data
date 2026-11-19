-- Threat: !InfrastructureShared
-- Name: 2db3de616fb7
-- Type: 21

if not mp.get_mpattribute("WPADSuspCacheFile") then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p1
l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
  mp.ReportLowfi(l_0_0, 1402450356)
end
return mp.INFECTED
