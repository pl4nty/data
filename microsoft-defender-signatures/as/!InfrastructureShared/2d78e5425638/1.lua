-- Threat: !InfrastructureShared
-- Name: 2d78e5425638
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
