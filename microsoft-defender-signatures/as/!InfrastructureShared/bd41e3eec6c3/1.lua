-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bd41e3eec6c3\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
do
  if not (nri.GetRawRequestBlob)() then
    local l_0_1, l_0_2, l_0_3 = (nri.GetRawResponseBlob)()
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  l_0_0.NRI_ResponseBlob = tohex(l_0_1)
  ;
  (nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
  return mp.INFECTED
end

