-- Threat: !InfrastructureShared
-- Name: !#Lua:SetPath
-- Type: 11
-- MpAttributes: RPF:TopLevelFile & pea_isdll & pea_hasexports & pea_amd64_image

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0, l_0_1 = pe.get_exports()
  for l_0_2 = 1, l_0_0 do
    if l_0_1[l_0_2].fn == 2934435936 then
      local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
      if l_0_3 then
        MpCommon.RequestSmsOnProcess(l_0_3, MpCommon.SMS_SCAN_MED)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
