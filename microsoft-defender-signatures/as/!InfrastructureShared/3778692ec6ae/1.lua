-- Threat: !InfrastructureShared
-- Name: 3778692ec6ae
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
