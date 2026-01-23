-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8341650fa419\1.luac 

-- params : ...
-- function num : 0
local l_0_1 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p1)
  local l_0_0 = {}
end
do
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = nil
  if (nri.GetRawRequestBlob)() == nil then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if contains(l_0_3, {"deserialization", "system.runtime.serialization", "invalid viewstate", "base64", "payload", "javaScriptserializer"}) then
    local l_0_4 = nil
    if (nri.GetURI)() then
      l_0_2.uri = (nri.GetURI)()
    end
    l_0_2.dest_address = l_0_1
    l_0_2.NRI_RBlob = tohex(l_0_3)
    ;
    (nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_2)
    local l_0_5 = nil
    local l_0_6 = reportHeaders
    l_0_6({"Host", "User-Agent"})
    l_0_6 = mp
    l_0_6 = l_0_6.INFECTED
    return l_0_6
  end
  do
    return mp.CLEAN
  end
end

