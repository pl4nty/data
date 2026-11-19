-- Threat: !InfrastructureShared
-- Name: 347814ecb4ed
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
