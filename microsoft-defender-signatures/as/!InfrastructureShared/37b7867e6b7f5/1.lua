-- Threat: !InfrastructureShared
-- Name: 37b7867e6b7f5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
