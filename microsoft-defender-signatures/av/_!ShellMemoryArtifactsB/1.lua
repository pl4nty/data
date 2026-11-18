-- Threat: \xac!ShellMemoryArtifacts.B
-- Type: 31

if not mp.get_mpattribute("HSTR:Trojan:Win32/MEM_KernelResolve_x64.B") then
  return mp.CLEAN
end
local l_0_0 = mp.GetSMSMemRanges()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.prot == 64 and l_0_2.state_type == mp.bitor(mp.SMS_MBI_COMMIT, mp.SMS_MBI_PRIVATE) then
    local l_0_3 = l_0_2.addr
    local l_0_4 = l_0_2.size
    local l_0_5 = l_0_4
    if 2048 < l_0_5 then
      l_0_5 = 2048
    end
    local l_0_6 = mp.ReadProcMem(l_0_3, l_0_5)
    if l_0_6 ~= nil then
      local l_0_7 = string.find(l_0_6, "This program cannot be run in DOS mode.\r\r\n", 1, true)
      if l_0_7 ~= nil and 78 <= l_0_7 then
        local l_0_8 = 0
        local l_0_9 = 0
        local l_0_10 = l_0_7 - 78
        local l_0_11 = mp.readu_u16(l_0_6, l_0_10)
        local l_0_12 = l_0_10 + mp.readu_u16(l_0_6, l_0_10 + 60)
        if l_0_12 < l_0_5 - 7 then
          l_0_8 = mp.readu_u16(l_0_6, l_0_12)
          l_0_9 = mp.readu_u16(l_0_6, l_0_12 + 6)
        end
        if l_0_11 == 23117 or l_0_8 == 17744 or 1 <= l_0_9 and l_0_9 <= 16 then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
