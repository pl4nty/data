-- Threat: !InfrastructureShared
-- Name: 23361766e6654
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
