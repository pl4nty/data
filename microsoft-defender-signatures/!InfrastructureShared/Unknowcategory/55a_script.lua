-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\55a_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_9 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil then
    local l_0_2 = nil
    for l_0_6,l_0_7 in pairs((mp.GetExecutablesFromCommandLine)(l_0_0)) do
      local l_0_3 = nil
      if (string.match)(l_0_8, "^(\\\\[^\\]+\\[^\\]+)") or (string.find)(l_0_8, "EngagementsCHU.vbs", 1, true) or (string.find)(l_0_8, "EnginCHU.vbs", 1, true) or (string.find)(l_0_8, "PACS_Launcher.vbs", 1, true) then
        return mp.CLEAN
      end
    end
  end
  do
    local l_0_10 = nil
    if (this_sigattrlog[2]).matched then
      l_0_10 = (this_sigattrlog[2]).utf8p1
    end
    local l_0_11 = (string.lower)(l_0_10)
    if not l_0_10 or not l_0_11:match("hkcu\\software\\[^\\]+$") then
      return mp.CLEAN
    end
    local l_0_12, l_0_13 = nil, nil
    if (this_sigattrlog[3]).matched then
      l_0_12 = (this_sigattrlog[3]).utf8p2
      l_0_13 = (this_sigattrlog[3]).utf8p1
    end
    if l_0_13 then
      l_0_13 = (string.lower)(l_0_13)
      if (string.find)(l_0_13, l_0_11) and l_0_12 ~= nil and #l_0_12 > 1000 then
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

