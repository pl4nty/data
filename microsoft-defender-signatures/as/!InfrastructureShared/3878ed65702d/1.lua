-- Threat: !InfrastructureShared
-- Name: 3878ed65702d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
