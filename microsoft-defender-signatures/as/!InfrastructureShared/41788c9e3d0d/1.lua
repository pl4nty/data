-- Threat: !InfrastructureShared
-- Name: 41788c9e3d0d
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
