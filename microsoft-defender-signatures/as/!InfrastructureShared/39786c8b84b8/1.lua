-- Threat: !InfrastructureShared
-- Name: 39786c8b84b8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
