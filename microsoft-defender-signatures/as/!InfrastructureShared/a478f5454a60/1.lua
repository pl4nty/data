-- Threat: !InfrastructureShared
-- Name: a478f5454a60
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
