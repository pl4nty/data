-- Threat: !InfrastructureShared
-- Name: 4e78edd185c1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
