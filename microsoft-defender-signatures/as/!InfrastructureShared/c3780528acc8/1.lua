-- Threat: !InfrastructureShared
-- Name: c3780528acc8
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
