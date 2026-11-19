-- Threat: !InfrastructureShared
-- Name: 647858c35774
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
