-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11dd7bcffc93a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC28: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC29: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC30: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("crashforexceptionexportthunk")("crashforexception_exportthunk") do
    if StringEndsWith(l_0_1, l_0_7) then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

