-- Threat: !InfrastructureShared
-- Name: 3b7824022c88
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
