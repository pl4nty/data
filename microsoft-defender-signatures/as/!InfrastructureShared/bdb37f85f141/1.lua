-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bdb37f85f141\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

  do
    if l_0_0 ~= nil then
      local l_0_2 = nil
      if extractDllForRegproc(l_0_0) and (mp.IsKnownFriendlyFile)(extractDllForRegproc(l_0_0), true, false) == false then
        (bm.add_threat_file)(extractDllForRegproc(l_0_0))
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

