-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a0b3ca7a2d81\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1, l_0_2 = , pcall(bm.get_imagepath)
if not l_0_2 or isnull(R4_PC8) then
  return mp.INFECTED
end
l_0_1 = (string.lower)(R4_PC8)
-- DECOMPILER ERROR at PC21: Overwrote pending register: R4 in 'AssignReg'

;
(bm.add_related_string)(R4_PC8, l_0_1, bm.RelatedStringBMReport)
add_parents()
return mp.INFECTED

