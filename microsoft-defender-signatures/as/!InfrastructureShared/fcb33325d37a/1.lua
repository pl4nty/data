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
  local l_0_1 = contains
  local l_0_2 = l_0_0
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC20: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC25: Overwrote pending register: R1 in 'AssignReg'

  if l_0_1 then
    return l_0_1
  end
  -- DECOMPILER ERROR at PC30: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC31: Overwrote pending register: R4 in 'AssignReg'

  l_0_2 = l_0_2(l_0_3, "osdsetuphook")
  if l_0_2 and l_0_3 then
    for l_0_7,l_0_8 in ipairs(R5_PC39) do
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
          if l_0_13 and (string.match)(l_0_13, "^[%a]:\\") then
            l_0_11 = (sysio.GetFileSize)(l_0_13)
            l_0_9.size = l_0_11
            if (sysio.IsFileExists)(l_0_13) then
              local l_0_14 = (sysio.GetFileLastWriteTime)(l_0_13) / 10000000 - 11644473600
              local l_0_15 = (MpCommon.GetCurrentTimeT)()
              l_0_12 = l_0_15 - l_0_14
              l_0_9.age = l_0_12
              ;
              (table.insert)(l_0_1, l_0_9)
              ;
              (bm.add_related_file)(l_0_13)
            end
          end
        end
      end
    end
  end
  do
    do
      if next(l_0_1) then
        local l_0_16 = safeJsonSerialize(l_0_1)
        ;
        (bm.add_related_string)("UntrustedEntities", l_0_16, bm.RelatedStringBMReport)
        ;
        (bm.trigger_sig)("SetupMode_Block", l_0_16)
      end
      local l_0_17 = contains
      local l_0_18 = l_0_0
      do
        local l_0_19 = {}
        -- DECOMPILER ERROR at PC141: No list found for R6 , SetList fails

        -- DECOMPILER ERROR at PC145: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC146: Overwrote pending register: R4 in 'AssignReg'

        if l_0_17 then
          l_0_17(l_0_18, l_0_19)
        end
        -- DECOMPILER ERROR at PC150: Overwrote pending register: R1 in 'AssignReg'

        do return l_0_1.INFECTED end
        -- WARNING: undefined locals caused missing assignments!
      end
    end
  end
end

