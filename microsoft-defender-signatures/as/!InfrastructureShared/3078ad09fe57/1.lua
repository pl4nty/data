-- Threat: !InfrastructureShared
-- Name: 3078ad09fe57
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
