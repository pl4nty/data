-- Threat: !InfrastructureShared
-- Name: 9a78fd4b645c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
