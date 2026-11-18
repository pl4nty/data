-- Threat: !InfrastructureShared
-- Name: 7db342c17bfb
-- Type: 21

if mp.get_sigattr_event_count(16384) > 50 then
  return mp.CLEAN
end
return mp.INFECTED
