-- Threat: !InfrastructureShared
-- Name: b378a1ad501c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
