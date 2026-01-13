-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\138415a99c42a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = (nri.GetRawRequestBlob)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC17: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC18: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC19: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC20: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC34: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC36: Overwrote pending register: R7 in 'AssignReg'

if (".exec")("exploit", "child_process") then
  (nri.AddTelemetry)((mp.bitor)((mp.bitor)(("_chunks").Telemetry_HOSTNAME, ("spawn").Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
  local l_0_3 = reportHeaders
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC48: No list found for R4 , SetList fails

  l_0_3(l_0_4)
  -- DECOMPILER ERROR at PC51: Overwrote pending register: R3 in 'AssignReg'

  return l_0_3
end
do
  do
    -- DECOMPILER ERROR at PC53: Overwrote pending register: R3 in 'AssignReg'

    do return l_0_3.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

