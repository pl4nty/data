-- Threat: !InfrastructureShared
-- Name: 9d785643a705
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
