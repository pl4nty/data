-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!MpTamperDisableFeatureWdD\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 then
  local l_0_1 = {}
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC11: No list found for R2 , SetList fails

  local l_0_3 = {}
  -- DECOMPILER ERROR at PC13: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC15: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC16: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC19: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC20: Overwrote pending register: R5 in 'AssignReg'

  l_0_2 = l_0_2(l_0_3, "", "\\windows\\ccm\\")
  -- DECOMPILER ERROR at PC24: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC25: Overwrote pending register: R3 in 'AssignReg'

  if l_0_2 then
    return l_0_3
  end
end
do
  return mp.INFECTED
end

