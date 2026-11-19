-- Threat: !InfrastructureShared
-- Name: 407815527d41
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
