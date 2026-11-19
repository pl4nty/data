-- Threat: !InfrastructureShared
-- Name: ba78a1c0d70b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
