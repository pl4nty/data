-- Threat: !InfrastructureShared
-- Name: 59788f8a8549
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
