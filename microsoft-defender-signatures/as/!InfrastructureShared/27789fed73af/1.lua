-- Threat: !InfrastructureShared
-- Name: 27789fed73af
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
