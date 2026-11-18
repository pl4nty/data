-- Threat: !InfrastructureShared
-- Name: 657890ab6973
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
