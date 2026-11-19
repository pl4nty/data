-- Threat: !InfrastructureShared
-- Name: 287846bc7243
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
