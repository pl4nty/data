-- Threat: !InfrastructureShared
-- Name: 45b39beb8ac8
-- Type: 21

if mp.get_sigattr_event_count(16385) > 2 or 2 < mp.get_sigattr_event_count(16386) then
  return mp.INFECTED
end
return mp.CLEAN
