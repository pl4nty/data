-- Threat: !InfrastructureShared
-- Name: a678cb7e35b0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
