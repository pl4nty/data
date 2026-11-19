-- Threat: !InfrastructureShared
-- Name: 168780a6754ff
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
