-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!ShellMemoryArtifactsE\Unknowcategory\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.GetSMSMemRanges)()
if l_0_1 < 2 then
  return mp.CLEAN
end
for l_0_5,l_0_6 in pairs(l_0_0) do
  if (l_0_6.prot == 4 or l_0_6.prot == 64) and (l_0_6.state_type == (mp.bitor)(mp.SMS_MBI_MAPPED, mp.SMS_MBI_PRIVATE) or l_0_6.state_type == mp.SMS_MBI_PRIVATE) then
    local l_0_7 = l_0_6.addr
    local l_0_8 = l_0_6.size
    do
      if l_0_8 <= 2048 or 2048 < 0 then
        local l_0_9, l_0_10 = 1024
      end
      -- DECOMPILER ERROR at PC46: Confused about usage of register: R9 in 'UnsetPending'

      local l_0_11 = nil
      if (mp.ReadProcMem)(l_0_7, l_0_9) ~= nil then
        local l_0_12 = nil
        if (string.find)((mp.ReadProcMem)(l_0_7, l_0_9), "This program cannot be run in DOS mode.\r\r\n", 1, true) ~= nil and (string.find)((mp.ReadProcMem)(l_0_7, l_0_9), "This program cannot be run in DOS mode.\r\r\n", 1, true) >= 78 then
          local l_0_13 = nil
          local l_0_14 = 0
          local l_0_15 = 0
          local l_0_16 = nil
          local l_0_17 = (mp.readu_u16)(l_0_12, l_0_13 - 78)
          -- DECOMPILER ERROR at PC81: Confused about usage of register: R16 in 'UnsetPending'

          if l_0_16 + (mp.readu_u16)(l_0_12, l_0_16 + 60) < l_0_11 - 7 then
            l_0_14 = (mp.readu_u16)(l_0_12, l_0_16 + (mp.readu_u16)(l_0_12, l_0_16 + 60))
            -- DECOMPILER ERROR at PC87: Confused about usage of register: R16 in 'UnsetPending'

            l_0_15 = (mp.readu_u16)(l_0_12, l_0_16 + (mp.readu_u16)(l_0_12, l_0_16 + 60) + 6)
          end
          if l_0_17 == 23117 or l_0_14 == 17744 or l_0_15 >= 1 and l_0_15 <= 16 then
            return mp.INFECTED
          end
        end
      end
      do
        -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
return mp.CLEAN

