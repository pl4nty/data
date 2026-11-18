-- Threat: !InfrastructureShared
-- Name: 165b32b4b65ea
-- Type: 21

if mp.get_sigattr_event_count(16385) > 4 and 4 < mp.get_sigattr_event_count(16386) then
  return mp.INFECTED
end
return mp.CLEAN
