-- Threat: !InfrastructureShared
-- Name: 4c785e759b78
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
