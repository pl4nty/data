-- Threat: !InfrastructureShared
-- Name: 6f7875af06da
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
