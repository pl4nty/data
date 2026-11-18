-- Threat: !InfrastructureShared
-- Name: 21783a7949ae
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
