-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4c6b3d82895cd\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC38: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p2 ~= nil then
      local l_0_1 = (this_sigattrlog[2]).utf8p1
    end
    -- DECOMPILER ERROR at PC64: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p2 ~= nil then
        local l_0_2, l_0_3, l_0_4 = (this_sigattrlog[4]).utf8p1
      end
      if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
        local l_0_5, l_0_6 = , ((this_sigattrlog[6]).utf8p1):match("^(.-)\\\\(.-)$")
        if l_0_6 == nil or (this_sigattrlog[6]).utf8p1 == nil then
          return mp.CLEAN
        end
        local l_0_7 = nil
        do
          if GetRegistryValue(l_0_6, R5_PC91) then
            local l_0_8, l_0_9 = , (string.find)(R5_PC91, "\f\000\002\000\001", 80, true)
            if not R5_PC91 then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC128: Overwrote pending register: R9 in 'AssignReg'

            -- DECOMPILER ERROR at PC137: Overwrote pending register: R9 in 'AssignReg'

            if (string.find)(l_0_8, " \136\0034\167\003", R9_PC112, true) or (string.find)(l_0_8, "\129\019ʦS\214", R9_PC112, true) or (string.find)(l_0_8, "\f\136\027gO\244", R9_PC112, true) or (string.find)(l_0_8, "\1720*��=", R9_PC112, true) then
              return mp.CLEAN
            end
          end
          return mp.INFECTED
        end
      end
    end
  end
end

