-- Threat: !InfrastructureShared
-- Name: 2ab785328da72
-- Type: 21

if mp.get_mpattribute("RPF:PEHasIOAVURL") then
  mp.set_mpattribute("HSTR:IOAVDownloadAdmin")
end
return mp.CLEAN
