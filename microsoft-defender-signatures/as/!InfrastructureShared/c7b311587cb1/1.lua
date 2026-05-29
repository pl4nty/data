-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c7b311587cb1\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
    if l_0_0 then
      l_0_1 = normalize_path
      l_0_2 = l_0_0
      l_0_1 = l_0_1(l_0_2)
      l_0_0 = l_0_1
    end
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil or #l_0_0 <= 8 then
    return mp.CLEAN
  end
  local l_0_4 = nil
  if not (function(l_1_0)
  -- function num : 0_0
  local l_1_1 = string.lower
  do
    l_1_1 = l_1_1(l_1_0 or "")
    for l_1_6,l_1_7 in ipairs({".exe", ".dll", ".scr", ".cpl", ".com", ".bat", ".cmd", ".ps1", ".vbs", ".vbe", ".js", ".jse", ".wsf", ".wsh", ".hta"}) do
      local l_1_3 = nil
      -- DECOMPILER ERROR at PC29: Confused about usage of register: R7 in 'UnsetPending'

      if StringEndsWith(l_1_1, ".com") then
        return true
      end
    end
    do return false end
    -- DECOMPILER ERROR at PC39: freeLocal<0 in 'ReleaseLocals'

  end
end
)(l_0_4) then
    return mp.CLEAN
  end
  local l_0_5 = nil
  if (mp.IsKnownFriendlyFile)(l_0_4, false, false) == true then
    return mp.CLEAN
  end
  AppendToRollingQueue(l_0_4, "software_deployment_tools_dropped_file", 1, 900)
  AppendToRollingQueue(l_0_4, "BM:MsIntuneDeployment.A", 1, 900)
  return mp.INFECTED
end

