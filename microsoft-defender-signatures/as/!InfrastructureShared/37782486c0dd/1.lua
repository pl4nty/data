-- Threat: !InfrastructureShared
-- Name: 37782486c0dd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
