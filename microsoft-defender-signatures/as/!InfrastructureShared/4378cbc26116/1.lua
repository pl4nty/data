-- Threat: !InfrastructureShared
-- Name: 4378cbc26116
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
