-- Threat: !InfrastructureShared
-- Name: 2578c8aba31e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
