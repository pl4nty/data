-- Threat: !InfrastructureShared
-- Name: 2d78ca2f6412
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
