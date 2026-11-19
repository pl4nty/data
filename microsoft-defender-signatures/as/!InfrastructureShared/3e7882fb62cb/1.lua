-- Threat: !InfrastructureShared
-- Name: 3e7882fb62cb
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
