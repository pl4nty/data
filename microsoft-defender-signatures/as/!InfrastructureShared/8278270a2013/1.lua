-- Threat: !InfrastructureShared
-- Name: 8278270a2013
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
