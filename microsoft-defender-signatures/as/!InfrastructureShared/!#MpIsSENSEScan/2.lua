-- Threat: !InfrastructureShared
-- Name: !#MpIsSENSEScan
-- Type: 12

if mp.GetScanSource() == mp.SCANSOURCE_SENSE then
  return mp.INFECTED
end
return mp.CLEAN
