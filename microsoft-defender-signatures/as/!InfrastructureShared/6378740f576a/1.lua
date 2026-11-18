-- Threat: !InfrastructureShared
-- Name: 6378740f576a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
