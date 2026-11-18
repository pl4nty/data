-- Threat: !InfrastructureShared
-- Name: a2781fbf7935
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
