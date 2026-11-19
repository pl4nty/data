-- Threat: !InfrastructureShared
-- Name: b54028349fd1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
