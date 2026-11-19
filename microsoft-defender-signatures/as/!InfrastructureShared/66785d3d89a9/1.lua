-- Threat: !InfrastructureShared
-- Name: 66785d3d89a9
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
