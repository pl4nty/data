-- Threat: !InfrastructureShared
-- Name: 567825f7f179
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
