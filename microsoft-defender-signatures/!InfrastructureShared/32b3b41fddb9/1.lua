-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3b41fddb9\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = {}
  local l_0_1 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  if not isnull(l_0_1) then
    for l_0_5 = 1, #l_0_1.file_paths do
      local l_0_6 = ((l_0_1.file_paths)[l_0_5]).path
      local l_0_7 = ((l_0_1.file_paths)[l_0_5]).renamed_path
      if not isnull(l_0_6) and not isnull(l_0_7) then
        local l_0_8 = l_0_6:match("[^\\]+$")
        local l_0_9 = l_0_7:match("[^\\]+$")
        local l_0_10 = (l_0_9:match("(.+)%..+")):lower()
        local l_0_11 = (l_0_8:match("(.+)%..+")):lower()
        if l_0_10 == l_0_11 then
          local l_0_12 = (l_0_7:match("%.[^%.]+$")):lower()
          if l_0_12 and (mp.GetExtensionClass)(l_0_12) == 0 then
            if l_0_0[l_0_12] ~= nil then
              (table.insert)(l_0_0[l_0_12], 1)
            else
              local l_0_13 = {}
              -- DECOMPILER ERROR at PC84: No list found for R13 , SetList fails

            end
            do
              -- DECOMPILER ERROR at PC88: Overwrote pending register: R14 in 'AssignReg'

              local l_0_14 = (sysio.GetFileSize)(1)
              do
                local l_0_15 = (sysio.ReadFile)(l_0_7, 0, 4)
                -- DECOMPILER ERROR at PC98: Confused about usage of register: R15 in 'UnsetPending'

                ;
                ((l_0_1.file_paths)[l_0_5]).fileSize = l_0_14
                -- DECOMPILER ERROR at PC101: Confused about usage of register: R15 in 'UnsetPending'

                ;
                ((l_0_1.file_paths)[l_0_5]).magic = l_0_15
                -- DECOMPILER ERROR at PC102: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC102: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC102: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC102: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC102: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC102: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC102: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  for l_0_19,l_0_20 in pairs(l_0_0) do
    if #l_0_0[l_0_19] >= 4 then
      l_0_1.rename_ext = l_0_19
      local l_0_21 = safeJsonSerialize(l_0_1)
      ;
      (bm.add_related_string)("genrn_ransom_meta", l_0_21, bm.RelatedStringBMReport)
      ;
      (bm.trigger_sig)("GenericRansomware:ReplaceExtension", l_0_21)
      return mp.INFECTED
    end
  end
end
do
  l_0_0 = mp
  l_0_0 = l_0_0.CLEAN
  return l_0_0
end

