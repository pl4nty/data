-- Threat: !InfrastructureShared
-- Name: 4278e3263206
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
