-- Threat: !InfrastructureShared
-- Name: 28787412f62e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
