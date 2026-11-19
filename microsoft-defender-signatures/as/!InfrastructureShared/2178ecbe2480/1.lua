-- Threat: !InfrastructureShared
-- Name: 2178ecbe2480
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
