-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b7b32dd96c1f\1.luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 30000000 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC20: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

  if #l_0_0 < 70 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = l_0_0:sub(1, -2)
  local l_0_2 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = {}
  for l_1_6 = 1, #l_1_1 do
    l_1_2[l_1_1[l_1_6]] = true
  end
  local l_1_7 = 0
  for l_1_11 = 1, #l_1_0 do
    if l_1_2[l_1_0[l_1_11]] then
      l_1_7 = l_1_7 + 1
    end
  end
  return l_1_7
end

  local l_0_3, l_0_4 = (bm.get_process_relationships)()
  for l_0_8,l_0_9 in ipairs(l_0_4) do
    local l_0_10 = (mp.bitand)(l_0_9.reason_ex, bm.RELATIONSHIP_CREATED)
    if l_0_10 == bm.RELATIONSHIP_CREATED then
      local l_0_11 = l_0_9.cmd_line
      do
        local l_0_12 = l_0_9.ppid or ""
        local l_0_13, l_0_14 = , pcall(MpCommon.CommandLineToArgv, l_0_11)
        local l_0_15, l_0_16 = , pcall(MpCommon.CommandLineToArgv, l_0_1)
        if not l_0_14 or isnull(l_0_15) or type(l_0_15) ~= "table" or isnull(#l_0_15) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC98: Overwrote pending register: R17 in 'AssignReg'

        if not l_0_16 or isnull(R17_PC89) or type(R17_PC89) ~= "table" or isnull(R17_PC89) then
          return mp.CLEAN
        end
        if #l_0_15 == 1 or l_0_15[1] == nil then
          return mp.CLEAN
        end
        if #MpCommon.CommandLineToArgv == 1 or (MpCommon.CommandLineToArgv)[1] == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC124: Overwrote pending register: R17 in 'AssignReg'

        if #MpCommon.CommandLineToArgv ~= R17_PC89 then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC132: Overwrote pending register: R17 in 'AssignReg'

        ;
        (bm.add_related_string)(R17_PC89, tostring(l_0_1), bm.RelatedStringBMReport)
        -- DECOMPILER ERROR at PC140: Overwrote pending register: R17 in 'AssignReg'

        do
          local l_0_17 = nil
          -- DECOMPILER ERROR at PC143: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC144: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC147: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC148: Overwrote pending register: R17 in 'AssignReg'

          if l_0_2(R17_PC89, l_0_15) ~= R17_PC89 then
            return R17_PC89
          end
          -- DECOMPILER ERROR at PC152: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC153: Overwrote pending register: R17 in 'AssignReg'

          if l_0_13 then
            R17_PC89("ProcRunMRU", l_0_11, l_0_13)
          end
          -- DECOMPILER ERROR at PC158: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC159: Overwrote pending register: R17 in 'AssignReg'

          do return R17_PC89 end
          -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return mp.CLEAN
end

