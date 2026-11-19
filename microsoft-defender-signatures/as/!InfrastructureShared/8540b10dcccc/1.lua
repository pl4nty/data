-- Threat: !InfrastructureShared
-- Name: 8540b10dcccc
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
