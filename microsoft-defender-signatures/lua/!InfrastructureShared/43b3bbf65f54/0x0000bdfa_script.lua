-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43b3bbf65f54\0x0000bdfa_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_4 = nil, nil
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

  do
    if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
      local l_0_3, l_0_5 = , NormalizeCmdline("powershell", l_0_0)
    end
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_5 == nil then
      return mp.CLEAN
    end
    local l_0_6 = nil
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

    if contains(l_0_5, {"get-netipconfiguration", "ipv4defaultgateway", "invoke-restmethod", "b64xorencode", "polltask"}) then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

