-- Threat: !InfrastructureShared
-- Name: 5378c52da221
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
