-- Threat: !InfrastructureShared
-- Name: 4278edcfb1b1
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
