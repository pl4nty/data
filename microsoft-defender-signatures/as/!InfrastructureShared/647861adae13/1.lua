-- Threat: !InfrastructureShared
-- Name: 647861adae13
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
