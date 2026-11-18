-- Threat: !InfrastructureShared
-- Name: 12540e2ee9482
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
