-- Threat: !InfrastructureShared
-- Name: bd78c65d7212
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
