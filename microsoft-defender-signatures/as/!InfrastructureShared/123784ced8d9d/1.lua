-- Threat: !InfrastructureShared
-- Name: 123784ced8d9d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
