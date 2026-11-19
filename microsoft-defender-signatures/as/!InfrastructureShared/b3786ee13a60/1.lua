-- Threat: !InfrastructureShared
-- Name: b3786ee13a60
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
