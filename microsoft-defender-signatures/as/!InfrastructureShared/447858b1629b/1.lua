-- Threat: !InfrastructureShared
-- Name: 447858b1629b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
