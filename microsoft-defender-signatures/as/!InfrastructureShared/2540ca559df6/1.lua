-- Threat: !InfrastructureShared
-- Name: 2540ca559df6
-- Type: 21

if mp.get_mpattribute("MpKernelModeEmu") then
  return mp.CLEAN
end
return mp.INFECTED
