-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\cab3e6393a53\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[3]).matched then
  local l_0_0 = nil
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = {}
  local l_0_2, l_0_3 = pcall(mp.GetExecutablesFromCommandLine, l_0_0)
  if l_0_2 and l_0_3 then
    for l_0_7,l_0_8 in ipairs(l_0_3) do
      local l_0_9 = {}
      l_0_9.path = l_0_8
      l_0_8 = (mp.ContextualExpandEnvironmentVariables)(l_0_8)
      if l_0_8 then
        local l_0_10 = (mp.IsKnownFriendlyFile)(l_0_8, true, false)
        ;
        (bm.add_related_string)("FriendlyFile", l_0_8, bm.RelatedStringBMReport)
        if l_0_10 == nil or l_0_10 == false then
          local l_0_11 = 0
          local l_0_12 = 0
          local l_0_13 = (MpCommon.PathToWin32Path)(l_0_8)
          local l_0_14 = contains
          local l_0_15 = l_0_13
          local l_0_16 = {}
          -- DECOMPILER ERROR at PC64: No list found for R16 , SetList fails

          -- DECOMPILER ERROR at PC68: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC69: Overwrote pending register: R14 in 'AssignReg'

          if l_0_14 then
            return l_0_14
          end
          -- DECOMPILER ERROR at PC73: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC74: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC80: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC81: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC82: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC86: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC87: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC88: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC92: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC93: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC94: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC96: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC97: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC98: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC99: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC103: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC104: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC105: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC106: Overwrote pending register: R18 in 'AssignReg'

          if l_0_13 and l_0_14 and l_0_14 then
            l_0_16("C:\\Windows\\", "C:\\Program Files")
            -- DECOMPILER ERROR at PC108: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC109: Overwrote pending register: R16 in 'AssignReg'

            l_0_16(l_0_13)
          end
        end
      end
    end
  end
  do
    do
      if next(l_0_1) then
        (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
      end
      return mp.INFECTED
    end
  end
end

