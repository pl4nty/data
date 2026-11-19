-- Threat: !InfrastructureShared
-- Name: 5578cf2892a4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
