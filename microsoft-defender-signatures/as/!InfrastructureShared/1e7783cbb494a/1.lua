-- Threat: !InfrastructureShared
-- Name: 1e7783cbb494a
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
