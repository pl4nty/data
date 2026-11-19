-- Threat: !InfrastructureShared
-- Name: 76787ced1d33
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
