-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6141791cb82e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = (nri.GetRawRequestBlob)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
local l_0_3 = {}
-- DECOMPILER ERROR at PC15: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC16: Overwrote pending register: R4 in 'AssignReg'

if ("pg_sleep")(l_0_2, l_0_3) then
  l_0_0.NRI_RequestBlob = tohex(l_0_2)
  ;
  (nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
  return mp.INFECTED
end
return mp.CLEAN

