-- Threat: !InfrastructureShared
-- Name: 154087c56668
-- Type: 21

if mp.get_mpattribute("SIGATTR:Reboon") then
  return mp.INFECTED
end
return mp.CLEAN
