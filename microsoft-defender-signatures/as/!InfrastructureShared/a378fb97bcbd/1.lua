-- Threat: !InfrastructureShared
-- Name: a378fb97bcbd
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
