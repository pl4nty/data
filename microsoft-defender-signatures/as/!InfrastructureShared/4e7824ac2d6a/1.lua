-- Threat: !InfrastructureShared
-- Name: 4e7824ac2d6a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
