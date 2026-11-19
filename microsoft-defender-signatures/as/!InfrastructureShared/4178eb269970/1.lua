-- Threat: !InfrastructureShared
-- Name: 4178eb269970
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
