-- Threat: !InfrastructureShared
-- Name: 3078c4860c49
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
