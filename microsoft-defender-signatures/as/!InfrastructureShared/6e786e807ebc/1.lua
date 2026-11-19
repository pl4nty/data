-- Threat: !InfrastructureShared
-- Name: 6e786e807ebc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
