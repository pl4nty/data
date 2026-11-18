-- Threat: !InfrastructureShared
-- Name: 227890b28dfd
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
