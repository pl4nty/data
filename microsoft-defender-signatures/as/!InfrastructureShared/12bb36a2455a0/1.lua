-- Threat: !InfrastructureShared
-- Name: 12bb36a2455a0
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if bm.GetSignatureMatchDuration() > 200000000 then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
TrackPidAndTechniqueBM(this_sigattrlog[2].ppid, "T1003", "ntdsutil_shadowcopy_access")
add_parents()
return mp.INFECTED
