-- Threat: !InfrastructureShared
-- Name: e47818d3191b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
