-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5541e5ab071b\1.luac 

-- params : ...
-- function num : 0
if isnull(this_sigattrlog[2]) or isnull((this_sigattrlog[2]).utf8p1) or not isPublicIP((this_sigattrlog[2]).utf8p1) then
  return mp.CLEAN
end
local l_0_0 = {}
l_0_0.accept = (nri.GetHttpRequestHeader)("Accept") or ""
l_0_0.acceptencoding = (nri.GetHttpRequestHeader)("Accept-Encoding") or ""
l_0_0.connection = (nri.GetHttpRequestHeader)("Connection") or ""
l_0_0.date = (nri.GetHttpRequestHeader)("Date") or ""
l_0_0.dest = (this_sigattrlog[2]).utf8p1 or ""
l_0_0.host = (nri.GetHttpRequestHeader)("Host") or ""
l_0_0.httpmethod = (nri.GetHttpCommand)() or ""
l_0_0.server = (nri.GetHttpRequestHeader)("Server") or ""
l_0_0.useragent = (nri.GetHttpRequestHeader)("User-Agent") or ""
;
(nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED

