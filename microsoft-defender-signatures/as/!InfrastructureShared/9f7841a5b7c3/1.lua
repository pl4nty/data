-- Threat: !InfrastructureShared
-- Name: 9f7841a5b7c3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
