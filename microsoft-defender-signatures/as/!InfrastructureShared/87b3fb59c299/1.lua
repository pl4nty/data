-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\87b3fb59c299\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_3 = (string.lower)((this_sigattrlog[2]).utf8p2)
  if not (string.find)(l_0_3, "\\appdata\\local\\temp\\", 1, true) ~= nil or (string.find)(l_0_3, "\\temp\\", 1, true) ~= nil or (string.find)(l_0_3, "%temp%", 1, true) ~= nil then
    return mp.CLEAN
  end
  local l_0_7 = nil
  do
    local l_0_8, l_0_9 = false, (bm.get_process_relationships)()
    if l_0_9 == nil then
      return mp.CLEAN
    end
    for l_0_13,l_0_14 in ipairs(l_0_9) do
      local l_0_10 = nil
      -- DECOMPILER ERROR at PC74: Confused about usage of register: R9 in 'UnsetPending'

      if R9_PC74.image_path ~= nil and ((string.find)((string.lower)(R9_PC74.image_path), "\\code.exe", 1, true) or (string.find)((string.lower)(R9_PC74.image_path), "\\code - insiders.exe", 1, true) or (string.find)((string.lower)(R9_PC74.image_path), "\\cursor.exe", 1, true) or (string.find)((string.lower)(R9_PC74.image_path), "\\windsurf.exe", 1, true) or (string.find)((string.lower)(R9_PC74.image_path), "\\trae.exe", 1, true)) then
        do
          do
            l_0_8 = true
            do break end
            -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    if not l_0_8 then
      return mp.CLEAN
    end
    ;
    (bm.add_related_string)("proc_cmdline", l_0_3, bm.RelatedStringBMReport)
    add_parents()
    do return mp.INFECTED end
    -- DECOMPILER ERROR: 7 unprocessed JMP targets
  end
end

