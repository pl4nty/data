-- Threat: !InfrastructureShared
-- Name: 1a788b32fd80
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
