-- Threat: !InfrastructureShared
-- Name: 8878a82334bc
-- Type: 21

if peattributes.isvbpcode == true then
  return mp.INFECTED
end
return mp.CLEAN
