-- Threat: !InfrastructureShared
-- Name: 9578fc611c44
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
