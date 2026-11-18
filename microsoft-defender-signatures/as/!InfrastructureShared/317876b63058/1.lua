-- Threat: !InfrastructureShared
-- Name: 317876b63058
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
