-- Threat: !InfrastructureShared
-- Name: 6d61f135a0c1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.CLEAN
end
return mp.INFECTED
