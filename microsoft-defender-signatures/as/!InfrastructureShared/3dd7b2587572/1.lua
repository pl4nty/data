-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3dd7b2587572\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
local l_0_2 = (string.gsub)(l_0_1, "[\"\'`^()+#&]", "")
local l_0_3 = contains
local l_0_4 = l_0_2
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC30: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC34: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC35: Overwrote pending register: R3 in 'AssignReg'

  if not l_0_3 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC38: Overwrote pending register: R3 in 'AssignReg'

  do return l_0_3 end
  -- WARNING: undefined locals caused missing assignments!
end

