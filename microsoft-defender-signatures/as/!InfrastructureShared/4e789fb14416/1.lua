-- Threat: !InfrastructureShared
-- Name: 4e789fb14416
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
