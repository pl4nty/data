-- Threat: !InfrastructureShared
-- Name: 4ab320576c20
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  TrackPidAndTechniqueBM("BM", "T1027.002", "DefenseEvasionn_SoftwarePacking_mt2023")
  bm.trigger_sig(this_sigattrlog[1].utf8p1, "UPXELFDroppedSelf")
  local l_0_0 = mp.GetParentProcInfo()
  if l_0_0 ~= nil and l_0_0.ppid ~= nil then
    bm.trigger_sig(this_sigattrlog[1].utf8p1, "UPXELFDroppedParent", l_0_0.ppid)
  end
  return mp.INFECTED
end
return mp.CLEAN
