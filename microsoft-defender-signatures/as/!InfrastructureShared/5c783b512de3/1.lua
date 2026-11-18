-- Threat: !InfrastructureShared
-- Name: 5c783b512de3
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
