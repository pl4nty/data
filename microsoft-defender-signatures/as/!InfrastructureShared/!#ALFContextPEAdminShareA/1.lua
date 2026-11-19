-- Threat: !InfrastructureShared
-- Name: !#ALF:ContextPEAdminShare.A
-- Type: 9

if peattributes.isdll or peattributes.isdamaged then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH):lower()
  if l_0_0:sub(1, 8) == "\\device\\" then
    l_0_0 = MpCommon.PathToWin32Path(l_0_0):lower()
  end
  if l_0_0 == "c:\\windows" and mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID) < 12 and "" == mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME) then
    if mp.getfilesize() < 1048576 then
      mp.set_mpattribute("Lua:ContextPEAdminShare.A1")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
