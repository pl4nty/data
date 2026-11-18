-- Threat: !InfrastructureShared
-- Name: c5407a0db24e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
