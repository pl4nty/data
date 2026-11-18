-- Threat: !InfrastructureShared
-- Name: MemMappedImage
-- Type: 1

function CheckMZPEIfMapped()
  local l_1_0 = mp.GetSMSMemRanges()
  
  for l_1_1, l_1_2 in pairs(l_1_0) do
    if l_1_2.prot == 64 and l_1_2.state_type == mp.bitor(mp.SMS_MBI_COMMIT, mp.SMS_MBI_PRIVATE) then
      local l_1_3 = l_1_2.addr
      local l_1_4 = l_1_2.size
      local l_1_5 = l_1_4
      if 2048 < l_1_5 then
        l_1_5 = 2048
      end
      local l_1_6 = mp.ReadProcMem(l_1_3, l_1_5)
      if l_1_6 ~= nil then
        local l_1_7 = string.find(l_1_6, "This program cannot be run in DOS mode.\r\r\n", 1, true)
        if l_1_7 ~= nil and 78 <= l_1_7 then
          local l_1_8 = 0
          local l_1_9 = 0
          local l_1_10 = l_1_7 - 78
          local l_1_11 = mp.readu_u16(l_1_6, l_1_10)
          local l_1_12 = l_1_10 + mp.readu_u16(l_1_6, l_1_10 + 60)
          if l_1_12 < l_1_5 - 7 then
            l_1_8 = mp.readu_u16(l_1_6, l_1_12)
            l_1_9 = mp.readu_u16(l_1_6, l_1_12 + 6)
          end
          if l_1_11 == 23117 or l_1_8 == 17744 or 1 <= l_1_9 and l_1_9 <= 16 then
            return true
          end
        end
      end
    end
  end
  return false
end
