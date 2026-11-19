-- Threat: !InfrastructureShared
-- Name: ba78b155a6f7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
