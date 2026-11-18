-- Threat: !InfrastructureShared
-- Name: 53b308442aa8
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].ppid ~= nil then
  l_0_0 = this_sigattrlog[2].ppid
  l_0_0 = GetRealPidForScenario(l_0_0)
  if IsPidObservedGlobal(l_0_0) then
    local l_0_1, l_0_2 = bm.get_process_relationships()
    for l_0_3, l_0_4 in ipairs(l_0_2) do
      TrackPidAndTechniqueBM(l_0_4.ppid, "iis_exch_childproc", "iis_exch_childproc", 28800)
    end
  end
end
return mp.CLEAN
