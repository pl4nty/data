-- Threat: !InfrastructureShared
-- Name: 63780823a6b8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
