-- Threat: !InfrastructureShared
-- Name: 4d7819f29807
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
