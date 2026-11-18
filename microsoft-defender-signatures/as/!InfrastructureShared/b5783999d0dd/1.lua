-- Threat: !InfrastructureShared
-- Name: b5783999d0dd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
