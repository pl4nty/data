-- Threat: !InfrastructureShared
-- Name: 8540cbe74f33
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
