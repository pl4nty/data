-- Threat: !InfrastructureShared
-- Name: 3078e4695da8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
