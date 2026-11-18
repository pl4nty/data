-- Threat: !InfrastructureShared
-- Name: 7e781d2f6f2a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
