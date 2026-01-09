-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3fb418a08d57c\1.luac 

-- params : ...
-- function num : 0
local l_0_1 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[1]).utf8p1)
  local l_0_0 = {}
end
do
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = nil
  if tonumber((nri.GetHttpResponseHeader)("Content-Length")) > 15000 then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if (nri.GetRawRequestBlob)() == nil then
    return mp.CLEAN
  end
  local l_0_4 = nil
  if contains(l_0_4, {"exec", "exploit", "binary", "start", "child_process", "_chunks"}) then
    local l_0_5 = nil
    if contains(l_0_4, {"wget", "curl", "powershell", "bash", "certutil", "cmd", "mshta", "python", "bitsadmin", "/bin/sh", "nc "}) then
      local l_0_6 = nil
      if (nri.GetURI)() then
        l_0_2.uri = (nri.GetURI)()
      end
      l_0_2.dest_address = l_0_1
      l_0_2.NRI_ResponseBlob = tohex(l_0_4)
      ;
      (nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_2)
      local l_0_7 = nil
      local l_0_8 = reportHeaders
      l_0_8({"Host", "User-Agent"})
      l_0_8 = mp
      l_0_8 = l_0_8.INFECTED
      return l_0_8
    end
  end
  do
    return mp.CLEAN
  end
end

