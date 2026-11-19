-- Threat: !InfrastructureShared
-- Name: 13d78dda6b76f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
