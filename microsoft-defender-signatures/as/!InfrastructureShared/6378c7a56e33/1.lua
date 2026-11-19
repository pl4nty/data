-- Threat: !InfrastructureShared
-- Name: 6378c7a56e33
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
