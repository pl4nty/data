-- Threat: !InfrastructureShared
-- Name: 5778d7a17669
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
