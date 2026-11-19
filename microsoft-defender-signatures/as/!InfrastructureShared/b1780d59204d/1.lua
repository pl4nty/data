-- Threat: !InfrastructureShared
-- Name: b1780d59204d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
