-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e3b3e420632f\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC15: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = nil
  if not (string.gsub)(l_0_0, "\"", "") then
    return mp.CLEAN
  end
  if contains((string.gsub)(l_0_0, "\"", ""), "curl.*http.*ping.*script", false) then
    return mp.INFECTED
  end
  if contains((string.gsub)(l_0_0, "\"", ""), "curl.*http.*ping.*rundll", false) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

