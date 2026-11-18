-- Threat: !InfrastructureShared
-- Name: 5478d5079dff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
