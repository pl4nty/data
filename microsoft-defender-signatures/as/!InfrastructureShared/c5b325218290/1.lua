-- Threat: !InfrastructureShared
-- Name: c5b325218290
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
  local l_0_1 = string.match(l_0_0, "SrcIp=([^;]+);")
  if not l_0_1 then
    return mp.CLEAN
  end
  if not IsHostAttackServer(l_0_1) then
    TrackAttackerServer(l_0_1)
  end
  TrackPidAndTechniqueBM("BM", "T1020", "active_attacker_server_connection_b")
  return mp.INFECTED
end
return mp.CLEAN
