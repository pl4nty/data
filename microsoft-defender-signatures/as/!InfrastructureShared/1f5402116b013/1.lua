-- Threat: !InfrastructureShared
-- Name: 1f5402116b013
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
