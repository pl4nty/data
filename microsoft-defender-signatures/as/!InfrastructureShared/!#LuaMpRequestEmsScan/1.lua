-- Threat: !InfrastructureShared
-- Name: !#Lua:MpRequestEmsScan
-- Type: 11
-- MpAttributes: MpRequestEmsScanTrigger

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  local l_0_0 = mp.get_mpattributevalue("MpRequestEmsScanTrigger")
  if l_0_0 == 0 then
    l_0_0 = 5000
  end
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  l_0_1 = MpCommon.PathToWin32Path(l_0_1):lower()
  local l_0_2 = {}
  table.insert(l_0_2, l_0_0 .. "_" .. l_0_1)
  MpCommon.SetPersistContextNoPath("Lua:MpRequestEmsScan", l_0_2, 3)
  return mp.INFECTED
end
return mp.CLEAN
