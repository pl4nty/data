-- Threat: !InfrastructureShared
-- Name: 25788993a37c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
