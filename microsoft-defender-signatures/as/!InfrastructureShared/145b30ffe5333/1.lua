-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\145b30ffe5333\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
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
  local l_0_4, l_0_5, l_0_6 = , IsFileRecentlyDropped(l_0_0:match("[%a]:\\[^\"%>%s]*%.dll"))
  do
    if l_0_5 and l_0_6 and R4_PC35 then
      local l_0_7 = nil
      if safeJsonDeserialize(R6_PC39) then
        R6_PC39 = (safeJsonDeserialize(R6_PC39)).UnsignedFile
        if R6_PC39 then
          R6_PC39 = mp
          R6_PC39 = R6_PC39.INFECTED
          return R6_PC39
        end
      end
    end
    return mp.CLEAN
  end
end

