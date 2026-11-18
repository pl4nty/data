-- Threat: !InfrastructureShared
-- Name: 12678a19d5525
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
