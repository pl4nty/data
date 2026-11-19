-- Threat: !InfrastructureShared
-- Name: 777844d7cc0d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
