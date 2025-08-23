-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\694186105dc0\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
  local l_0_0 = (this_sigattrlog[2]).utf8p1
  if (string.find)(l_0_0, ".installeranalytics.com", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = {}
  l_0_1.SIG_CONTEXT = "BM"
  l_0_1.CONTENT_SOURCE = "MSIEXEC_NRI"
  l_0_1.PROCESS_CONTEXT = "msiexec.exe"
  l_0_1.FILELESS = "false"
  l_0_1.CMDLINE_URL = "false"
  local l_0_2, l_0_3 = ExtractUrlGetReputation(l_0_0, l_0_1, true, 2, 60, false, 3000)
  if l_0_2 then
    (nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

