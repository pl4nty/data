-- Threat: !InfrastructureShared
-- Name: 1d7889261dde
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
