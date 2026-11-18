-- Threat: !InfrastructureShared
-- Name: 7a78f088e893
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
