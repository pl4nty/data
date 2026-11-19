-- Threat: !InfrastructureShared
-- Name: 132784c4a059b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
