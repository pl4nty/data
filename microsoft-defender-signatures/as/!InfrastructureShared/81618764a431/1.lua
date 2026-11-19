-- Threat: !InfrastructureShared
-- Name: 81618764a431
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
