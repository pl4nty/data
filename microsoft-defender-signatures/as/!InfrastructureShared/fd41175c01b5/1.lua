-- Threat: !InfrastructureShared
-- Name: fd41175c01b5
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
