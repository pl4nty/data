-- Threat: !InfrastructureShared
-- Name: 3678a808b940
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
