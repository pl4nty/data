-- Threat: !InfrastructureShared
-- Name: 3f78e9f81d44
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
