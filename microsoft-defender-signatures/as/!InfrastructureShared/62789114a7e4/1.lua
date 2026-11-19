-- Threat: !InfrastructureShared
-- Name: 62789114a7e4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
