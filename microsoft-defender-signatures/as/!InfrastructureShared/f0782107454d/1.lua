-- Threat: !InfrastructureShared
-- Name: f0782107454d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
