-- Threat: !InfrastructureShared
-- Name: 5b7856e687f5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
