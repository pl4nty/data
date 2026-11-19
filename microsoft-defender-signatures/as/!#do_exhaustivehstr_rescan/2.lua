-- Threat: !#do_exhaustivehstr_rescan
-- Type: 12
-- MpAttributes: BM_DEX_FILE

if mp.isparanoid() then
  mp.set_mpattribute("MpEnableExhaustiveDexScanning")
  return mp.INFECTED
end
return mp.CLEAN
