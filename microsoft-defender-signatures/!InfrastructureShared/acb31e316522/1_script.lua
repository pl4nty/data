-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\acb31e316522\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC25: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched then
      local l_0_1, l_0_2, l_0_3 = (this_sigattrlog[2]).utf8p2
    else
    end
    if (this_sigattrlog[4]).matched then
      do return mp.CLEAN end
      ;
      (bm.trigger_sig)("BM_MacCreatingInterpreter", (this_sigattrlog[4]).utf8p2)
      return mp.CLEAN
    end
  end
end

