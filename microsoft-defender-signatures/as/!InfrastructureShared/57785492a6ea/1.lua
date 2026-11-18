-- Threat: !InfrastructureShared
-- Name: 57785492a6ea
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
