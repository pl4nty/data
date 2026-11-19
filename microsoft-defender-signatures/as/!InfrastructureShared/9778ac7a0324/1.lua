-- Threat: !InfrastructureShared
-- Name: 9778ac7a0324
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
