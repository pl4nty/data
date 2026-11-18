-- Threat: !InfrastructureShared
-- Name: d97868117cc6
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
