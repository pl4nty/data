-- Threat: !InfrastructureShared
-- Name: 407862858b57
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
