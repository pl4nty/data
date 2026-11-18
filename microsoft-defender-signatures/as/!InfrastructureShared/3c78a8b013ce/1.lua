-- Threat: !InfrastructureShared
-- Name: 3c78a8b013ce
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
