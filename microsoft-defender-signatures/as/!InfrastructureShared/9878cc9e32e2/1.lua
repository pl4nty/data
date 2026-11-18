-- Threat: !InfrastructureShared
-- Name: 9878cc9e32e2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
