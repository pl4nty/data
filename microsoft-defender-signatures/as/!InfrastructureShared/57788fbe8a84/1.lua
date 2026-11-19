-- Threat: !InfrastructureShared
-- Name: 57788fbe8a84
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
