-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb39603f234\0x0000009e_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

  do
    if l_0_0 ~= nil then
      local l_0_2 = nil
      if not (string.match)(l_0_0, "macfqdn:([^;]+)") then
        return mp.CLEAN
      end
      if IsHostAttackServer((string.match)(l_0_0, "macfqdn:([^;]+)")) then
        AddResearchData("BM", true)
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

