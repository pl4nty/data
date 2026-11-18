-- Threat: !InfrastructureShared
-- Name: 1c7852d82b1e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
