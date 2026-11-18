-- Threat: !InfrastructureShared
-- Name: 4e78d0f4a37b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
