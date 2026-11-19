-- Threat: !InfrastructureShared
-- Name: 677878cd9e33
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
