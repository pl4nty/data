-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5741b4c13d59\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0.useragent = (nri.GetHttpRequestHeader)("User-Agent")
local l_0_1 = (nri.GetRawRequestBlob)()
if l_0_1 ~= nil and (string.len)(l_0_1) < 1024 then
  l_0_0.NRI_RequestBlob = tohex(l_0_1)
end
;
(nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED

