-- Threat: !InfrastructureShared
-- Name: 5bb3d83e2596
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = pcall(bm.GetMemQueryCount())
if l_0_1 ~= nil and 0 < l_0_1 then
  local l_0_2
  if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p2 ~= nil then
    l_0_2 = this_sigattrlog[2].utf8p2
    bm.add_related_string("MQp2", l_0_2, bm.RelatedStringBMReport)
    local l_0_3 = bm.get_current_process_startup_info()
    if l_0_3 ~= nil and l_0_3.ppid ~= nil then
      AddResearchData(l_0_3.ppid, true)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
