-- Threat: !InfrastructureShared
-- Name: 4e78c17a4b72
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
