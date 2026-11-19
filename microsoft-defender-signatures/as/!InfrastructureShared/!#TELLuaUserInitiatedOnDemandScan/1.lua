-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:UserInitiatedOnDemandScan
-- Type: 12

if mp.GetScanSource() ~= mp.SCANSOURCE_ONDEMAND then
  return mp.CLEAN
end
return mp.INFECTED
