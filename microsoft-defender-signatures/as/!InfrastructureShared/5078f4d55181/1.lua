-- Threat: !InfrastructureShared
-- Name: 5078f4d55181
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
