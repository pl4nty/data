-- Threat: !InfrastructureShared
-- Name: 8478985f93f9
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
