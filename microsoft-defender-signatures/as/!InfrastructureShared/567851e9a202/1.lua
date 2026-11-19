-- Threat: !InfrastructureShared
-- Name: 567851e9a202
-- Type: 21

if mp.get_mpattribute("SIGATTR:DisableRealtimeMonitoring") then
  return mp.INFECTED
end
return mp.CLEAN
