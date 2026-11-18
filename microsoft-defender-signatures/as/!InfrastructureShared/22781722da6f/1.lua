-- Threat: !InfrastructureShared
-- Name: 22781722da6f
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
