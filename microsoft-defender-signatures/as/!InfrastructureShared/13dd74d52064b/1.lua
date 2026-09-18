-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13dd74d52064b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  local l_0_2 = contains
  local l_0_3 = l_0_1
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC17: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC21: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC25: Overwrote pending register: R6 in 'AssignReg'

  if l_0_2 then
    l_0_2, l_0_4 = l_0_2(l_0_3, l_0_4), {"\\papercut mf\\", "\\papercut ng\\"}
    if l_0_2 then
      l_0_2 = mp
      l_0_2 = l_0_2.INFECTED
      return l_0_2
    end
  end
end
do
  return mp.CLEAN
end

