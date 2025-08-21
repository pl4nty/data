-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\125b3ddf68726\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_0, l_0_1, l_0_5, l_0_7 = nil, nil, nil, nil
  else
  end
  do
    if (not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" or (this_sigattrlog[4]).matched) and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" then
      local l_0_2, l_0_6, l_0_8 = (this_sigattrlog[3]).utf8p2, (this_sigattrlog[4]).utf8p1
    end
    do
      if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil and (this_sigattrlog[6]).utf8p1 ~= "" then
        local l_0_4, l_0_10 = nil
      end
      do
        if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
          local l_0_3, l_0_9 = nil
        end
        if not IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", (this_sigattrlog[6]).utf8p1) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

        local l_0_11 = nil
        if l_0_9:match("[^/]*$") == nil or l_0_9:match("[^/]*$") == "" then
          return mp.CLEAN
        end
        if (string.find)((this_sigattrlog[5]).utf8p2, l_0_9:match("[^/]*$"), 1, true) and (string.find)(l_0_11, l_0_9:match("[^/]*$"), 1, true) then
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

