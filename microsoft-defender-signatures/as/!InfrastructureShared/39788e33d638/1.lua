-- Threat: !InfrastructureShared
-- Name: 39788e33d638
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
