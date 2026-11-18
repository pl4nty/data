-- Threat: !InfrastructureShared
-- Name: 92782c73c6f8
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
