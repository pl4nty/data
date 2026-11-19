-- Threat: !InfrastructureShared
-- Name: d6785cb38a27
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
