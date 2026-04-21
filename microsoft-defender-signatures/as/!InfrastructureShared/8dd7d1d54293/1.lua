-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8dd7d1d54293\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = checkParentCmdline
local l_0_2 = l_0_0
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC15: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC16: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC20: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC21: Overwrote pending register: R1 in 'AssignReg'

  if l_0_1 then
    return l_0_1
  end
  -- DECOMPILER ERROR at PC23: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R1 in 'AssignReg'

  do return l_0_1 end
  -- WARNING: undefined locals caused missing assignments!
end

