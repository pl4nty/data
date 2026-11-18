-- Threat: !InfrastructureShared
-- Name: 4078bf9fe09d
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
