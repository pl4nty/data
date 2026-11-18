-- Threat: !InfrastructureShared
-- Name: 7b783ce9a9da
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
