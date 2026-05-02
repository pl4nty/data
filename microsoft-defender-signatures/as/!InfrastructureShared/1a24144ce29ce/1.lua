-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1a24144ce29ce\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = (nri.GetRawRequestBlob)()
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:match("[Aa]uthorization:%s*[Bb]asic%s+([A-Za-z0-9+/=]+)")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC22: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC23: Overwrote pending register: R4 in 'AssignReg'

local l_0_4 = "dXNlcj1yb290"
-- DECOMPILER ERROR at PC24: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC25: Overwrote pending register: R6 in 'AssignReg'

for l_0_8,l_0_9 in ("aGFzcm9vdD0x")("dGZhX3ZlcmlmaWVkPTE") do
  if (string.find)(l_0_2, l_0_9, 1, true) then
    l_0_4 = l_0_4 + 1
  end
end
if l_0_4 < 2 then
  return mp.CLEAN
end
l_0_0.hits = tostring(l_0_4)
l_0_0.AuthB64 = l_0_2:sub(1, 120)
l_0_0.NRI_RequestBlob = tohex(l_0_1)
;
(nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED

