-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\93b3c8167708\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 or l_0_0 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_3 = nil
  if not l_0_0:match("[%a]:\\[^\"%>%s]*%.dll") then
    return mp.CLEAN
  end
  if (mp.IsKnownFriendlyFile)(l_0_0:match("[%a]:\\[^\"%>%s]*%.dll"), true, false) then
    return mp.CLEAN
  end
  if IsFileRecentlyDropped(l_0_0:match("[%a]:\\[^\"%>%s]*%.dll")) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

