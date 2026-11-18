-- Threat: !InfrastructureShared
-- Name: 257837d94a0e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
