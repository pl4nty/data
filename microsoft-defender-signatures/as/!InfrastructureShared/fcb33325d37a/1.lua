-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fcb33325d37a\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[4]).matched then
  local l_0_0 = nil
  if not l_0_0 or #l_0_0 < 5 then
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
          -- DECOMPILER ERROR at PC67: No list found for R16 , SetList fails

          -- DECOMPILER ERROR at PC71: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC72: Overwrote pending register: R14 in 'AssignReg'

          if l_0_14 then
            return l_0_14
          end
          -- DECOMPILER ERROR at PC76: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC77: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC83: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC84: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC85: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC89: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC90: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC91: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC95: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC96: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC97: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC99: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC100: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC101: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC102: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC106: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC107: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC108: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC109: Overwrote pending register: R18 in 'AssignReg'

          if l_0_13 and l_0_14 and l_0_14 then
            l_0_16("C:\\Windows\\", "C:\\Program Files")
            -- DECOMPILER ERROR at PC111: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC112: Overwrote pending register: R16 in 'AssignReg'

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

