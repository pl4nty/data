-- Threat: \xac\xa1TestModifiedOwnershipScanReason
-- Type: 12
-- MpAttributes: !MpOnOpenOrCloseRtpScan & BM_TEXT_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == 19 then
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
  if l_0_1 == "/tmp/4f9c77e0-4aba-4143-894e-4e6241443435.txt" then
    return mp.INFECTED
  end
end
return mp.CLEAN
