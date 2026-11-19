-- Threat: !InfrastructureShared
-- Name: ae780aea5421
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
