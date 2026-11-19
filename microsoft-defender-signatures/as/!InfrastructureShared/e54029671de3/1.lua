-- Threat: !InfrastructureShared
-- Name: e54029671de3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
