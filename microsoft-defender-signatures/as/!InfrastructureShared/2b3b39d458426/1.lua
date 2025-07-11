-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2b3b39d458426\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil and (this_sigattrlog[7]).utf8p1 ~= "" then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC55: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[8]).matched or (this_sigattrlog[8]).utf8p1 == nil or (this_sigattrlog[8]).utf8p1 == "" or (this_sigattrlog[9]).matched) and (this_sigattrlog[9]).utf8p1 ~= nil and (this_sigattrlog[9]).utf8p1 ~= "" then
      local l_0_1, l_0_3, l_0_4, l_0_6, l_0_8 = (this_sigattrlog[8]).utf8p1, nil
    end
    do
      if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
        local l_0_2, l_0_5, l_0_7, l_0_9 = , (this_sigattrlog[2]).utf8p2
      else
      end
      -- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

      if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
        local l_0_10, l_0_11 = , (this_sigattrlog[3]).utf8p2
        if l_0_11 ~= nil and l_0_2 ~= nil and l_0_2:match("([^/]+%.app.*)/([^/]+)$") ~= nil and (string.find)(l_0_11, R6_PC108, 1, true) and (string.find)(l_0_11, R6_PC108, 1, true) then
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

