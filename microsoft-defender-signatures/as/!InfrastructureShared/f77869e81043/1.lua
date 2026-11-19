-- Threat: !InfrastructureShared
-- Name: f77869e81043
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
