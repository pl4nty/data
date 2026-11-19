-- Threat: !InfrastructureShared
-- Name: 38789e2070d5
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
