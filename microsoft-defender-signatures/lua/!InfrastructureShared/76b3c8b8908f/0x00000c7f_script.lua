-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\76b3c8b8908f\0x00000c7f_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  if (this_sigattrlog[2]).matched then
    (bm.trigger_sig)("ESPCreateFile.A", (this_sigattrlog[2]).utf8p1)
    return mp.CLEAN
  end
end

