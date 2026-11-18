-- Threat: !InfrastructureShared
-- Name: 1b78d2d0cdb7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
