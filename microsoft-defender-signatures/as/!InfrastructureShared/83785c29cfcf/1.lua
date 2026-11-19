-- Threat: !InfrastructureShared
-- Name: 83785c29cfcf
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
