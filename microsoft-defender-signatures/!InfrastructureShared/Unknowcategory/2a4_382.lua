-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\2a4_382.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0, l_0_1 = nil
else
  do
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_2 = nil
    for l_0_6 in ((string.match)(l_0_0, "port%s*{?([^}]*)}?")):gmatch("%d+") do
      local l_0_3 = nil
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R5 in 'UnsetPending'

      if R5_PC26 == "80" or R5_PC26 == "443" then
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

