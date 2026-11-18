-- Threat: !InfrastructureShared
-- Name: 3c784d17c095
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
