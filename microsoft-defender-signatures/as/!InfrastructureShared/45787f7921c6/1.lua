-- Threat: !InfrastructureShared
-- Name: 45787f7921c6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
