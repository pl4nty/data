-- Threat: !InfrastructureShared
-- Name: 2178f44acc94
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
