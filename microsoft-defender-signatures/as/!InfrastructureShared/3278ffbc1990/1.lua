-- Threat: !InfrastructureShared
-- Name: 3278ffbc1990
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
