-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaSACPrev\0x000006ab_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_mpattributevalue)("RPF:SACPrev:ML:prob:Malware")
if l_0_0 then
  local l_0_1 = SetAttributeFromClassifierScoresEx
  local l_0_2 = l_0_0
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC19: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC20: Overwrote pending register: R4 in 'AssignReg'

  l_0_1(l_0_2, l_0_3, 99)
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

