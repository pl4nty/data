-- Threat: !InfrastructureShared
-- Name: !#SLF:Linux/WebServerFileDrop.A
-- Type: 13
-- MpAttributes: MpOnModifiedCloseRtpScan & (BM_ELF_EXEC_FILE | BM_SH_FILE | BM_PY_FILE | BM_ELF_DYN_FILE)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
local l_0_1 = false
local l_0_2 = MpCommon.GetPersistContextNoPath("webserver_conf_root")
if l_0_2 ~= nil and 0 < #l_0_2 then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if string.match(l_0_0, l_0_4) then
      l_0_1 = true
      break
    end
  end
elseif string.match(l_0_0, "/var/www/") then
  l_0_1 = true
end
if l_0_1 then
  local l_0_5 = {
    "/run/nginx.pid",
    "/run/lighttpd.pid",
    "/run/apache2/apache2.pid",
    "/run/httpd/httpd.pid"
  }
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    if sysio.IsFileExists(l_0_7) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
