-- Threat: !InfrastructureShared
-- Name: 13478a009f3e9
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
