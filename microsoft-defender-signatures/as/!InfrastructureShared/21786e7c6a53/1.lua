-- Threat: !InfrastructureShared
-- Name: 21786e7c6a53
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
