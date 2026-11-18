-- Threat: !InfrastructureShared
-- Name: 2e29ca6e802f
-- Type: 21

if mp.get_mpattribute("Nscript:Type_bat") then
  return mp.INFECTED
end
return mp.CLEAN
