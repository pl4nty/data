-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7bd704e3ff45\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 or #l_0_1 <= 10 then
  return mp.CLEAN
end
local l_0_2 = GetRealPidForScenario("CMDHSTR")
TrackPidAndTechnique(l_0_2, "T1003", "ntdsutil_shadowcopy_access")
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC34: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC35: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC36: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC37: Overwrote pending register: R6 in 'AssignReg'

  if ("\\perflogs\\")("\\public\\", "c:\\temp") then
    return mp.INFECTED
  end
  do return mp.LOWFI end
  -- WARNING: undefined locals caused missing assignments!
end

