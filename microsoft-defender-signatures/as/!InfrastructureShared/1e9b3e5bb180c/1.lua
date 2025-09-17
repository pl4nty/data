-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e9b3e5bb180c\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 ~= nil and (this_sigattrlog[7]).utf8p2 ~= "" then
    local l_0_0, l_0_2, l_0_3, l_0_4, l_0_6 = nil, nil
  end
  do
    if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil and (this_sigattrlog[5]).utf8p1 ~= "" then
      local l_0_1, l_0_5, l_0_7 = , (this_sigattrlog[5]).utf8p1
    end
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

    do
      if l_0_5 ~= nil and l_0_5 ~= "" and l_0_1 ~= nil and l_0_1 ~= "" then
        local l_0_8 = nil
        if l_0_5:match("/([^/]+%.app)") ~= nil and l_0_5:match("/([^/]+%.app)") ~= "" and l_0_8:find(l_0_5:match("/([^/]+%.app)"), 1, true) then
          return mp.INFECTED
        end
      end
      return mp.CLEAN
    end
  end
end

