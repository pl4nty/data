-- Threat: !InfrastructureShared
-- Name: 60784784d73d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
