-- Threat: !InfrastructureShared
-- Name: 38786f515bb1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
