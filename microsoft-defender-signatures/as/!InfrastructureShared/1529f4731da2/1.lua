-- Threat: !InfrastructureShared
-- Name: 1529f4731da2
-- Type: 21

if mp.get_mpattribute("Nscript:Type_bat") then
  return mp.INFECTED
end
return mp.CLEAN
