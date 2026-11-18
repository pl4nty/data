-- Threat: !InfrastructureShared
-- Name: 4878feb8ae0e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
