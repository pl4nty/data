-- Threat: !InfrastructureShared
-- Name: 4e782b0565f9
-- Type: 21

if peattributes.no_security == true and pesecs[3].Name == "8way" then
  return mp.INFECTED
end
return mp.CLEAN
