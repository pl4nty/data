-- Threat: !InfrastructureShared
-- Name: 9d781de3ab24
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
