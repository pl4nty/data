-- Threat: !InfrastructureShared
-- Name: 5a78cd1e4ecf
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
