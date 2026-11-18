-- Threat: !InfrastructureShared
-- Name: bc29b46ae0d6
-- Type: 21

if mp.get_mpattribute("MpIsPowerShellAMSIScan") or mp.get_mpattribute("Nscript:Type_ps") or mp.get_mpattribute("AGGR:ScrFileExt.A") then
  return mp.INFECTED
end
return mp.CLEAN
