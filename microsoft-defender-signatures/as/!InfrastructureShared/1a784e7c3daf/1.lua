-- Threat: !InfrastructureShared
-- Name: 1a784e7c3daf
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
