-- Threat: !InfrastructureShared
-- Name: 1d781936eadb
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
