-- Threat: !InfrastructureShared
-- Name: 61b3aaea7d29
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].ppid
  if l_0_0 == nil then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM(l_0_0, "iis_exch_web", "iis_exch_web", 28800)
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    TrackPidAndTechniqueBM(l_0_4.ppid, "iis_exch_childproc", "iis_exch_childproc", 28800)
  end
end
return mp.CLEAN
