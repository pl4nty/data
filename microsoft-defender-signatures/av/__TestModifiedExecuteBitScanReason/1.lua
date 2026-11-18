-- Threat: \xac\xa1TestModifiedExecuteBitScanReason
-- Type: 12
-- MpAttributes: !MpOnOpenOrCloseRtpScan & BM_TEXT_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == 18 then
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
  if l_0_1 == "/tmp/e6c1b6df-5c4a-44ef-8453-2aed16108a33.txt" then
    return mp.INFECTED
  end
end
return mp.CLEAN
