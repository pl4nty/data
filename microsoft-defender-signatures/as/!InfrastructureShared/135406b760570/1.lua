-- Threat: !InfrastructureShared
-- Name: 135406b760570
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
