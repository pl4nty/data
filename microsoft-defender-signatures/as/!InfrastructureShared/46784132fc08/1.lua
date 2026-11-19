-- Threat: !InfrastructureShared
-- Name: 46784132fc08
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
