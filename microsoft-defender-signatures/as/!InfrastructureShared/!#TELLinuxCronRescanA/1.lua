-- Threat: !InfrastructureShared
-- Name: !#TEL:Linux/CronRescan.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_TEXT_FILE & MpOnModifiedCloseRtpScan & (LUA:FileSizeLE100.A | LUA:FileSizeLE200.A | LUA:FileSizeLE400.A | LUA:FileSizeLE800.A | LUA:FileSizeLE1000.A)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or #l_0_0 < 10 then
  return mp.CLEAN
end
local l_0_1 = {
  "/etc/cron",
  "/etc/crontab",
  "/var/spool/cron/"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.match(l_0_0, l_0_3) then
    local l_0_4 = tostring(headerpage)
    if l_0_4 == nil then
      return mp.CLEAN
    end
    for l_0_5 in string.gmatch(l_0_4, "/[^%s]+") do
      if sysio.IsFileExists(l_0_5) then
        mp.ReportLowfi(l_0_5, 215366885)
        if string.match(l_0_5, "/%.") then
          mp.ReportLowfi(l_0_5, 34864475)
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
