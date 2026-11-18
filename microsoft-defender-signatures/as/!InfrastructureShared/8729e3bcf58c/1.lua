-- Threat: !InfrastructureShared
-- Name: 8729e3bcf58c
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE2000.A") and (mp.get_mpattribute("MpIsPowerShellAMSIScan") or mp.get_mpattribute("Nscript:Type_ps") or mp.get_mpattribute("AGGR:ScrFileExt.A")) then
  return mp.INFECTED
end
return mp.CLEAN
