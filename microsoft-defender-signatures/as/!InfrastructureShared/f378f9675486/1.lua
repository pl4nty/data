-- Threat: !InfrastructureShared
-- Name: f378f9675486
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
