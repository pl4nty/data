-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2bdb32c037fdf\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
do
  if GetRollingQueueKeys("SusLampz") then
    local l_0_2, l_0_3 = , pcall(bm.get_imagepath)
    if not l_0_3 or isnull(R5_PC13) then
      return mp.INFECTED
    end
    l_0_1 = (string.lower)(R5_PC13)
    -- DECOMPILER ERROR at PC26: Overwrote pending register: R5 in 'AssignReg'

    ;
    (bm.add_related_string)(R5_PC13, l_0_1, bm.RelatedStringBMReport)
    add_parents()
    return mp.INFECTED
  end
  return mp.CLEAN
end

