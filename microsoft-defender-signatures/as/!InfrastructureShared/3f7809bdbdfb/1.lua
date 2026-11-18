-- Threat: !InfrastructureShared
-- Name: 3f7809bdbdfb
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
