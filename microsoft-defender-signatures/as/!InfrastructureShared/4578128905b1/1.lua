-- Threat: !InfrastructureShared
-- Name: 4578128905b1
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
