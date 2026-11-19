-- Threat: !InfrastructureShared
-- Name: 50781b60702e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
