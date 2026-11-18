-- Threat: !InfrastructureShared
-- Name: 111781f2be599
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
