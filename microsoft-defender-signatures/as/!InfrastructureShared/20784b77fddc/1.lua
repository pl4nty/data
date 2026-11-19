-- Threat: !InfrastructureShared
-- Name: 20784b77fddc
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
