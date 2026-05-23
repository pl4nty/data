-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a54156d3dd65\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = (nri.GetRawRequestBlob)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC21: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC22: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC23: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC38: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R8 in 'AssignReg'

  if ("../")("..\\", "%2e%2e%2f") then
    (nri.AddTelemetry)((mp.bitor)((mp.bitor)(("%2e%2e/").Telemetry_HOSTNAME, ("..%2f").Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

