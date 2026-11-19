-- Threat: !InfrastructureShared
-- Name: 5329ed84a254
-- Type: 21

if mp.get_mpattribute("MpIsPowerShellAMSIScan") or mp.get_mpattribute("Nscript:Type_ps") then
  return mp.INFECTED
end
return mp.CLEAN
