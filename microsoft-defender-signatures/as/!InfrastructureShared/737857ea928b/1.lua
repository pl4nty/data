-- Threat: !InfrastructureShared
-- Name: 737857ea928b
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
