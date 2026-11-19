-- Threat: !InfrastructureShared
-- Name: 10a78a4a1f7ce
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
