-- Threat: !InfrastructureShared
-- Name: 20616b1c0278
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
