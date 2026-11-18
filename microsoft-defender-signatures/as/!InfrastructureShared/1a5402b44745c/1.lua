-- Threat: !InfrastructureShared
-- Name: 1a5402b44745c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
