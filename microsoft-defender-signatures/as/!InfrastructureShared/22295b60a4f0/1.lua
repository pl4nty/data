-- Threat: !InfrastructureShared
-- Name: 22295b60a4f0
-- Type: 21

if mp.get_mpattribute("MpIsPowerShellAMSIScan") or mp.get_mpattribute("Nscript:Type_ps") then
  return mp.INFECTED
end
return mp.CLEAN
