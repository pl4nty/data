-- Threat: !InfrastructureShared
-- Name: af7806324f3d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
