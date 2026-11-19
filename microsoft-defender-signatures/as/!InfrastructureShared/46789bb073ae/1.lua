-- Threat: !InfrastructureShared
-- Name: 46789bb073ae
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
