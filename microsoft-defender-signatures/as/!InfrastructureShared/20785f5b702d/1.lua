-- Threat: !InfrastructureShared
-- Name: 20785f5b702d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
