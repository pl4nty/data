-- Threat: !InfrastructureShared
-- Name: 26785c1952fc
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
