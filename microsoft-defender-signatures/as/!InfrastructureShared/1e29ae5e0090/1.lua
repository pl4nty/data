-- Threat: !InfrastructureShared
-- Name: 1e29ae5e0090
-- Type: 21

if mp.get_mpattribute("Nscript:Type_bat") then
  return mp.INFECTED
end
return mp.CLEAN
