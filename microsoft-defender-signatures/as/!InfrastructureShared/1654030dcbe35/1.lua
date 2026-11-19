-- Threat: !InfrastructureShared
-- Name: 1654030dcbe35
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
