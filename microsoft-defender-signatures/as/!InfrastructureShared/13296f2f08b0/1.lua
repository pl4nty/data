-- Threat: !InfrastructureShared
-- Name: 13296f2f08b0
-- Type: 21

if mp.get_mpattribute("Nscript:Type_bat") then
  return mp.INFECTED
end
return mp.CLEAN
