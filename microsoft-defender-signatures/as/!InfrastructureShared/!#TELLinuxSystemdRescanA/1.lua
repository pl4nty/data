-- Threat: !InfrastructureShared
-- Name: !#TEL:Linux/SystemdRescan.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_TEXT_FILE & MpOnModifiedCloseRtpScan & (LUA:FileSizeLE100.A | LUA:FileSizeLE200.A | LUA:FileSizeLE400.A | LUA:FileSizeLE800.A | LUA:FileSizeLE1000.A)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or #l_0_0 < 20 then
  return mp.CLEAN
end
if string.match(l_0_0, "/etc/systemd/system/([%w%-_]+)%.service") then
  local l_0_1 = tostring(headerpage)
  l_0_1 = l_0_1:gsub("\r\n", "\n"):gsub("\r", "\n")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = false
  local l_0_3
  for l_0_4 in string.gmatch(l_0_1, [[
[^
]+]]) do
    l_0_3, _ = l_0_4:match("^%s*ExecStart%s*=%s*%-?%s*\"?([^\"%s]+)\"?%s*(.*)")
    if not l_0_3 then
      l_0_3, _ = l_0_4:match("^%s*ExecStartPre%s*=%s*%-?%s*\"?([^\"%s]+)\"?%s*(.*)")
    end
    if not l_0_3 then
      l_0_3, _ = l_0_4:match("^%s*ExecStartPost%s*=%s*%-?%s*\"?([^\"%s]+)\"?%s*(.*)")
    end
    if l_0_3 then
      if sysio.IsFileExists(l_0_3) then
        mp.ReportLowfi(l_0_3, 3488067509)
        l_0_2 = true
      end
      l_0_3 = nil
    end
  end
  if l_0_2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
