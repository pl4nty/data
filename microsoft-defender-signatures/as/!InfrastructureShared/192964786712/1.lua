-- Threat: !InfrastructureShared
-- Name: 192964786712
-- Type: 21

if mp.get_mpattribute("Nscript:Type_bat") then
  return mp.INFECTED
end
return mp.CLEAN
