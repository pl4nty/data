-- Threat: !InfrastructureShared
-- Name: 1978c26a64f3
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
