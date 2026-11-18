-- Threat: !InfrastructureShared
-- Name: ce78fbfd8531
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
