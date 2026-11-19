-- Threat: !InfrastructureShared
-- Name: 48781d81ccdb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
