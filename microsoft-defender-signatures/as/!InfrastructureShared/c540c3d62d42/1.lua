-- Threat: !InfrastructureShared
-- Name: c540c3d62d42
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
