-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b3a2217701\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  else
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_4 = nil
    for l_0_8,l_0_9 in pairs((mp.GetExecutablesFromCommandLine)((this_sigattrlog[2]).utf8p2)) do
      local l_0_5 = nil
      if (string.match)(l_0_10, "^(\\\\[^\\]+\\[^\\]+)") or (string.find)(l_0_10, "engagementschu.vbs", 1, true) or (string.find)(l_0_10, "enginchu.vbs", 1, true) or (string.find)(l_0_10, "pacs_launcher.vbs", 1, true) or (string.find)(l_0_10, "fidelity", 1, true) or (string.find)(l_0_10, "bginfo", 1, true) or (string.find)(l_0_10, "favoris_explorer", 1, true) then
        return mp.CLEAN
      end
    end
    local l_0_11 = nil
    -- DECOMPILER ERROR at PC117: Overwrote pending register: R2 in 'AssignReg'

    if (this_sigattrlog[4]).matched then
      do
        local l_0_12 = nil
        -- DECOMPILER ERROR at PC125: Overwrote pending register: R6 in 'AssignReg'

        if not l_0_12 or not ((string.lower)(nil)):match(l_0_10) then
          return mp.CLEAN
        end
        AppendToRollingQueue("big_reg_write", (string.lower)(nil), "found", 600)
        return mp.CLEAN
      end
    end
  end
end

