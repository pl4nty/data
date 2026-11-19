-- Threat: !InfrastructureShared
-- Name: af7828eab235
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
