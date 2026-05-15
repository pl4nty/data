-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5ab3198ebb3e\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = nil
  if not l_0_0:match("[%a]:\\[^\"%>%s]*%.dll") then
    return mp.CLEAN
  end
  if (mp.IsKnownFriendlyFile)(l_0_0:match("[%a]:\\[^\"%>%s]*%.dll"), true, false) then
    return mp.CLEAN
  end
  local l_0_3, l_0_4, l_0_5 = , IsFileRecentlyDropped(l_0_0:match("[%a]:\\[^\"%>%s]*%.dll"))
  do
    if l_0_4 and l_0_5 and true then
      local l_0_6 = nil
      if safeJsonDeserialize(R6_PC42) then
        R6_PC42 = (safeJsonDeserialize(R6_PC42)).UnsignedFile
        if R6_PC42 then
          R6_PC42 = mp
          R6_PC42 = R6_PC42.INFECTED
          return R6_PC42
        end
      end
    end
    return mp.CLEAN
  end
end

