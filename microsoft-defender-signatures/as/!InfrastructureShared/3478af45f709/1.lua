-- Threat: !InfrastructureShared
-- Name: 3478af45f709
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
