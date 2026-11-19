-- Threat: !InfrastructureShared
-- Name: cd788c5ea0e8
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
