-- Threat: !InfrastructureShared
-- Name: 10540c3c962c3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
