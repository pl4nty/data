-- Threat: !InfrastructureShared
-- Name: 15e78d20fd745
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
