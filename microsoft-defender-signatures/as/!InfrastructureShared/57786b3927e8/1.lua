-- Threat: !InfrastructureShared
-- Name: 57786b3927e8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
