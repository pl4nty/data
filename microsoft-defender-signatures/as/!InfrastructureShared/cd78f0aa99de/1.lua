-- Threat: !InfrastructureShared
-- Name: cd78f0aa99de
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
