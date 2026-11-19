-- Threat: !InfrastructureShared
-- Name: b278fc3e46a0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
