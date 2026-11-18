-- Threat: !InfrastructureShared
-- Name: fb784b4d49da
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
