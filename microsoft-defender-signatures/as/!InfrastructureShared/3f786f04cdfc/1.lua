-- Threat: !InfrastructureShared
-- Name: 3f786f04cdfc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
