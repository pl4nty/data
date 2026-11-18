-- Threat: !InfrastructureShared
-- Name: 6878cd587996
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
