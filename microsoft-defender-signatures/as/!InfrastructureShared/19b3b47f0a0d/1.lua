-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19b3b47f0a0d\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
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
  local l_0_4 = nil
  if not (this_sigattrlog[1]).utf8p2 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_5 = nil
  if (string.find)((string.lower)((this_sigattrlog[1]).utf8p2), "\\windows\\system32", 1, true) or (string.find)((string.lower)((this_sigattrlog[1]).utf8p2), "\\windows\\syswow64", 1, true) then
    return mp.CLEAN
  end
  local l_0_6, l_0_7, l_0_8 = , IsFileRecentlyDropped(l_0_4)
  do
    if l_0_7 and l_0_8 and "\\windows\\syswow64" then
      local l_0_9 = nil
      if safeJsonDeserialize(R8_PC72) then
        R8_PC72 = (safeJsonDeserialize(R8_PC72)).UnsignedFile
        if R8_PC72 then
          R8_PC72 = mp
          R8_PC72 = R8_PC72.INFECTED
          return R8_PC72
        end
      end
    end
    return mp.CLEAN
  end
end

