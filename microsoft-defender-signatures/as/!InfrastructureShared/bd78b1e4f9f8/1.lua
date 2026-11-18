-- Threat: !InfrastructureShared
-- Name: bd78b1e4f9f8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
