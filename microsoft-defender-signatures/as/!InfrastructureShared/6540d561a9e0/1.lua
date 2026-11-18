-- Threat: !InfrastructureShared
-- Name: 6540d561a9e0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
