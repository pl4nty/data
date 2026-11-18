-- Threat: !InfrastructureShared
-- Name: 2278bfd8bd3a
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
