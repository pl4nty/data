-- Threat: !InfrastructureShared
-- Name: 3578c80511af
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
