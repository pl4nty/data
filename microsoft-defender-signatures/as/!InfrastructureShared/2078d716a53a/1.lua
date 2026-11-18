-- Threat: !InfrastructureShared
-- Name: 2078d716a53a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
