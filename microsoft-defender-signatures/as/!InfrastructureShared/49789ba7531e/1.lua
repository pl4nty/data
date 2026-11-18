-- Threat: !InfrastructureShared
-- Name: 49789ba7531e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
