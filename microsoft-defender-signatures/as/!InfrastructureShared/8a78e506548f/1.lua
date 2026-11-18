-- Threat: !InfrastructureShared
-- Name: 8a78e506548f
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
