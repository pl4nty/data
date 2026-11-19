-- Threat: !InfrastructureShared
-- Name: 9a78e8800fe5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
