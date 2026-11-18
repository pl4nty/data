-- Threat: !InfrastructureShared
-- Name: !#Lua:Ransom:Win32/BastaIcoDropScanTrigger.A
-- Type: 12

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0 = mp.getfilesize()
  if l_0_0 ~= 16958 then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if string.sub(l_0_1, -4) ~= ".ico" then
    return mp.CLEAN
  end
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_2 ~= nil then
    MpCommon.RequestSmsOnProcess(l_0_2, MpCommon.SMS_SCAN_HIGH)
    mp.set_mpattribute(string.format("MpInternal_researchdata=FileName=%s,FileSize=%d,PPID=%s", l_0_1, l_0_0, l_0_2))
    return mp.INFECTED
  end
end
return mp.CLEAN
