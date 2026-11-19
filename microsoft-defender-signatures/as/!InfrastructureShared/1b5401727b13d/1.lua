-- Threat: !InfrastructureShared
-- Name: 1b5401727b13d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
