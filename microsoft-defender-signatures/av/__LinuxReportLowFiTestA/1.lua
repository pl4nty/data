-- Threat: \xac\xa1LinuxReportLowFiTest.A
-- Type: 13
-- MpAttributes: !MpOnOpenOrCloseRtpScan & BM_TEXT_FILE

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 ~= "/tmp/4f4acd0b-bfa7-48bc-992f-386874448d0d-reportlowfitestfile-1.txt" then
  return mp.CLEAN
else
  mp.ReportLowfi(l_0_0, 24039668)
end
return mp.INFECTED
