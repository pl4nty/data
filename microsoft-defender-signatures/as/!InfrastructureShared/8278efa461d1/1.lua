-- Threat: !InfrastructureShared
-- Name: 8278efa461d1
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
