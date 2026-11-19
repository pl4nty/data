-- Threat: !InfrastructureShared
-- Name: 80780426bdf5
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
