-- Threat: !InfrastructureShared
-- Name: 2478378cf11e
-- Type: 21

if (peattributes.isdll == true or peattributes.isexe == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
