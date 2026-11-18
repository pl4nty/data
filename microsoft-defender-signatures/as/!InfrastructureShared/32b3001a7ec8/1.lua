-- Threat: !InfrastructureShared
-- Name: 32b3001a7ec8
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and this_sigattrlog[1].utf8p2 ~= "" then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if sysio.IsFileExists(l_0_0) then
    bm.add_threat_file(l_0_0)
    bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
  end
  return mp.INFECTED
end
return mp.CLEAN
