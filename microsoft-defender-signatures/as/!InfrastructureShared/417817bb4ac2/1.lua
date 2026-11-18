-- Threat: !InfrastructureShared
-- Name: 417817bb4ac2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
