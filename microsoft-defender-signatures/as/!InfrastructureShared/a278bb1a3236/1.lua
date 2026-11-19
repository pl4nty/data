-- Threat: !InfrastructureShared
-- Name: a278bb1a3236
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.checks_if_debugged_undocumented then
  return mp.INFECTED
end
return mp.CLEAN
