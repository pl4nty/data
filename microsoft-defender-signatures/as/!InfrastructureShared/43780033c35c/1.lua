-- Threat: !InfrastructureShared
-- Name: 43780033c35c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
