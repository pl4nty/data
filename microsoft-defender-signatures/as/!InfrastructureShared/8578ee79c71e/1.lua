-- Threat: !InfrastructureShared
-- Name: 8578ee79c71e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
