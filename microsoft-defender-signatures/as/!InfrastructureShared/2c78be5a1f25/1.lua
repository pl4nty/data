-- Threat: !InfrastructureShared
-- Name: 2c78be5a1f25
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
