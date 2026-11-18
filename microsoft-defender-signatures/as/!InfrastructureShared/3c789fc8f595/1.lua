-- Threat: !InfrastructureShared
-- Name: 3c789fc8f595
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
