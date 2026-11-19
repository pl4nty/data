-- Threat: !InfrastructureShared
-- Name: 2778cab6b8c0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
