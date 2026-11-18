-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:PE:UpxPackedProcLaunch
-- Type: 10
-- MpAttributes: BM_UPX_PACKED

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.INFECTED
end
return mp.CLEAN
