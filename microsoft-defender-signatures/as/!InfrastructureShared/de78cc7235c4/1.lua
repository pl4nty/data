-- Threat: !InfrastructureShared
-- Name: de78cc7235c4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
