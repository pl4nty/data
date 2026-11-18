-- Threat: !InfrastructureShared
-- Name: 7141830727d3
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
