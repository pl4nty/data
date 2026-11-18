-- Threat: !InfrastructureShared
-- Name: 637819471d29
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
