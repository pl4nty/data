-- Threat: !InfrastructureShared
-- Name: 69b342cddd06
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local l_0_0 = bm.get_connection_string()
if l_0_0 then
  local l_0_1 = string.match(l_0_0, "DestIp=([^;]+)")
  if not l_0_1 then
    return mp.CLEAN
  end
  if IsHostAttackServer(l_0_1) then
    local l_0_2
    if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
      l_0_2 = this_sigattrlog[2].utf8p2
    end
    if l_0_2 ~= nil then
      bm.request_SMS(this_sigattrlog[2].ppid, "L")
      bm.trigger_sig("active_attacker_server_connection_a", l_0_0, this_sigattrlog[2].ppid)
      TrackPidAndTechniqueBM("BM", "T1020", "active_attacker_server_connection_a")
      bm_AddRelatedFileFromCommandLine(l_0_2, nil, nil, 1)
      bm.set_detection_string("AttackerServer:" .. l_0_1)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
