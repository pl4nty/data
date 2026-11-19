-- Threat: !InfrastructureShared
-- Name: 33781f05b87a
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
