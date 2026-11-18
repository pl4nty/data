-- Threat: !InfrastructureShared
-- Name: 427883f658e0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
