-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\694186105dc0\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
  local l_0_0 = (this_sigattrlog[2]).utf8p1
  local l_0_1 = {}
  l_0_1.SIG_CONTEXT = "BM"
  l_0_1.CONTENT_SOURCE = "MSIEXEC_NRI"
  l_0_1.PROCESS_CONTEXT = "msiexec.exe"
  l_0_1.FILELESS = "false"
  l_0_1.CMDLINE_URL = "false"
  local l_0_2 = SafeGetUrlReputation
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC22: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC23: Overwrote pending register: R4 in 'AssignReg'

  l_0_2 = l_0_2(l_0_3, l_0_0, false, 3000)
  l_0_3 = l_0_2.urls
  l_0_3 = l_0_3[l_0_0]
  if l_0_3 then
    l_0_3 = l_0_2.urls
    l_0_3 = l_0_3[l_0_0]
    l_0_3 = l_0_3.determination
    if l_0_3 == 2 then
      l_0_3 = l_0_2.urls
      l_0_3 = l_0_3[l_0_0]
      l_0_3 = l_0_3.confidence
      if l_0_3 >= 60 then
        l_0_3 = nri
        l_0_3 = l_0_3.AddTelemetry
        l_0_3((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
        l_0_3 = mp
        l_0_3 = l_0_3.INFECTED
        return l_0_3
      end
    end
  end
end
do
  return mp.CLEAN
end

