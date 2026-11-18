-- Threat: !InfrastructureShared
-- Name: 2c29d7da859c
-- Type: 21

if mp.get_mpattribute("MpIsPowerShellAMSIScan") or mp.get_mpattribute("Nscript:Type_ps") then
  return mp.INFECTED
end
return mp.CLEAN
