-- Threat: !InfrastructureShared
-- Name: b578fe9b3ff5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
