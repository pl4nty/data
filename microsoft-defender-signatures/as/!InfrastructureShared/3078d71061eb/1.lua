-- Threat: !InfrastructureShared
-- Name: 3078d71061eb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
