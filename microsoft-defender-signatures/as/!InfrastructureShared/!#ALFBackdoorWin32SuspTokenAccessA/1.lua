-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win32/SuspTokenAccess.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID)
  if l_0_0 == 4 then
    local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
    if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
      return mp.CLEAN
    end
    if string.match(l_0_2, "^a_%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%.pwd$") and string.find(l_0_1, "\\appdata\\local\\packages\\microsoft.aad.brokerplugin_", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
