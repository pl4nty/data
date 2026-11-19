-- Threat: !InfrastructureShared
-- Name: 3540dc1b0ee0
-- Type: 21

if mp.get_mpattribute("SIGATTR:Reboon") then
  return mp.INFECTED
end
return mp.CLEAN
