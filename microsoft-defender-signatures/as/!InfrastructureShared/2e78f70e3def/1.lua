-- Threat: !InfrastructureShared
-- Name: 2e78f70e3def
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
