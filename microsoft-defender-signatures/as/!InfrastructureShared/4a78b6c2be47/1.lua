-- Threat: !InfrastructureShared
-- Name: 4a78b6c2be47
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
