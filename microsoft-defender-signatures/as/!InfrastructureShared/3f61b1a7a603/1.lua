-- Threat: !InfrastructureShared
-- Name: 3f61b1a7a603
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if mp.HSTR_CALLER_SMS == l_0_0 then
  local l_0_1 = mp.GetSMSLevel()
  if l_0_1 ~= mp.SMS_SCAN_ONCE_ADV and l_0_1 ~= mp.SMS_SCAN_LOW_ADV and l_0_1 ~= mp.SMS_SCAN_MED_ADV and l_0_1 ~= mp.SMS_SCAN_HIGH_ADV then
    return mp.CLEAN
  end
  local l_0_2 = mp.hstr_full_log()
  for l_0_3, l_0_4 in pairs(l_0_2) do
    if l_0_4.matched and l_0_4.VA then
      local l_0_5, l_0_6 = mp.SMSVirtualQuery(l_0_4.VA)
      if l_0_5 ~= true then
        return mp.CLEAN
      end
      if (l_0_6.prot == 64 or l_0_6.prot == 4) and (l_0_6.state_type == mp.SMS_MBI_MAPPED or l_0_6.state_type == mp.bitor(mp.SMS_MBI_COMMIT, mp.SMS_MBI_MAPPED) or l_0_6.state_type == mp.SMS_MBI_PRIVATE or l_0_6.state_type == mp.bitor(mp.SMS_MBI_COMMIT, mp.SMS_MBI_PRIVATE)) then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
