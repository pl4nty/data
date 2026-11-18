-- Threat: !InfrastructureShared
-- Name: b4786d8578c8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
