-- Threat: !InfrastructureShared
-- Name: !#ALF:ContextPECRoot.A
-- Type: 9
-- MpAttributes: !pea_isdll & !pea_isdamaged

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH):lower()
  if l_0_0:sub(1, 8) == "\\device\\" then
    l_0_0 = MpCommon.PathToWin32Path(l_0_0):lower()
  end
  if l_0_0 == "c:" and mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID) < 12 and "" == mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME) then
    if mp.getfilesize() < 1048576 then
      mp.set_mpattribute("Lua:ContextPECRoot.A1")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
