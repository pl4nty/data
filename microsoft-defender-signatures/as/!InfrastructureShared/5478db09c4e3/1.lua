-- Threat: !InfrastructureShared
-- Name: 5478db09c4e3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
