-- Threat: !InfrastructureShared
-- Name: 402919623a77
-- Type: 21

if mp.get_mpattribute("MpIsPowerShellAMSIScan") or mp.get_mpattribute("Nscript:Type_ps") or mp.get_mpattribute("AGGR:ScrFileExt.A") then
  return mp.INFECTED
end
return mp.CLEAN
