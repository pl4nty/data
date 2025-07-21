-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\676b359910190\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
-- DECOMPILER ERROR at PC7: Overwrote pending register: R1 in 'AssignReg'

if (this_sigattrlog[5]).matched then
  local l_0_1 = nil
else
  do
    -- DECOMPILER ERROR at PC16: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC25: Overwrote pending register: R1 in 'AssignReg'

    do
      if not (this_sigattrlog[6]).matched or (this_sigattrlog[7]).matched then
        local l_0_3, l_0_6 = , nil
      end
      do
        if (this_sigattrlog[4]).matched then
          local l_0_2, l_0_4, l_0_5 = (this_sigattrlog[4]).utf8p2
        end
        -- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

        if not l_0_2 or not l_0_4 then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

        local l_0_7 = nil
        if (MpCommon.StringRegExpSearch)("microsoft\\\\windows defender|\\\\programData\\\\microsoft$", l_0_4:sub(#l_0_2 + 1)) then
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

