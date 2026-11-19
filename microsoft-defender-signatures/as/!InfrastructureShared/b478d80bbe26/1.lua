-- Threat: !InfrastructureShared
-- Name: b478d80bbe26
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
