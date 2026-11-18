-- Threat: !InfrastructureShared
-- Name: 4f78e2d45a4c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
