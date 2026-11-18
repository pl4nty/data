-- Threat: !InfrastructureShared
-- Name: 1e7869e98c36
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
