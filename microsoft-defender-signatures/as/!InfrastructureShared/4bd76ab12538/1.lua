-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4bd76ab12538\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC51: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC52: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC53: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

  if not ("captcha")("robot", "bot") then
    return mp.CLEAN
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

