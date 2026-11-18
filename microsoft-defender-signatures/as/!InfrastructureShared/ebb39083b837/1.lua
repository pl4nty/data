-- Threat: !InfrastructureShared
-- Name: ebb39083b837
-- Type: 21

if mp.get_sigattr_event_count(16395) > 10 then
  return mp.INFECTED
end
return mp.CLEAN
