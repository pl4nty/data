-- Threat: \xac!ShellMemoryArtifacts.E
-- Type: 31

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0, r0_1 = mp.GetSMSMemRanges()
if r0_1 < 2 then
  return mp.CLEAN
end
for r0_2, r0_3 in pairs(r0_0) do
  if (r0_3.prot == 4 or r0_3.prot == 64)
    and (r0_3.state_type == mp.bitor(mp.SMS_MBI_MAPPED, mp.SMS_MBI_PRIVATE)
      or r0_3.state_type == mp.SMS_MBI_PRIVATE) then
    local r0_4 = r0_3.addr
    local r0_5 = r0_3.size
    local r0_6 = r0_5
    r0_6 = r0_6 > 2048 and 2048 or r0_6 < 0 and 1024 or r0_6
    local r0_7 = mp.ReadProcMem(r0_4, r0_6)
    if r0_7 ~= nil then
      local r0_8 = string.find(r0_7, "This program cannot be run in DOS mode.\r\r\n", 1, true)
      if r0_8 ~= nil and r0_8 >= 78 then
        local r0_9, r0_10 = 0, 0
        local r0_11 = r0_8 - 78
        local r0_12 = mp.readu_u16(r0_7, r0_11)
        local r0_13 = mp.readu_u16(r0_7, r0_11 + 60)
        r0_13 = r0_11 + r0_13
        if r0_13 < r0_6 - 7 then
          r0_9, r0_10 = mp.readu_u16(r0_7, r0_13), mp.readu_u16(r0_7, r0_13 + 6)
        end
        if r0_12 == 23117 or r0_9 == 17744 or r0_10 >= 1 and r0_10 <= 16 then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
