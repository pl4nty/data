-- Threat: !InfrastructureShared
-- Name: a461baea2000
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
