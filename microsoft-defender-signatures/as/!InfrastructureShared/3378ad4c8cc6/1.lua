-- Threat: !InfrastructureShared
-- Name: 3378ad4c8cc6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
