-- Threat: !InfrastructureShared
-- Name: 137787fecd525
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
