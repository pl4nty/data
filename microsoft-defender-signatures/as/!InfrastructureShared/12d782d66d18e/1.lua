-- Threat: !InfrastructureShared
-- Name: 12d782d66d18e
-- Type: 21

if peattributes.ismsil ~= true then
  return mp.CLEAN
end
return mp.INFECTED
