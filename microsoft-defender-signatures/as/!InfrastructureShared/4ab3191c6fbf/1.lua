-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab3191c6fbf\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 or l_0_0 == "" then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if not contains(l_0_3, {"\\appdata\\", "\\temp\\"}) then
    return mp.CLEAN
  end
  local l_0_4 = nil
  if not l_0_3:match("([a-zA-Z]:\\[^\"%s<>]*%.exe)") then
    return mp.CLEAN
  end
  if IsFileRecentlyDropped(l_0_3:match("([a-zA-Z]:\\[^\"%s<>]*%.exe)")) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

