-- Threat: !InfrastructureShared
-- Name: fd7892493bbb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
