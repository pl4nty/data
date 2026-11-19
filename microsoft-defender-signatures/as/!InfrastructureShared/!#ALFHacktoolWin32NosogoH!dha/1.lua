-- Threat: !InfrastructureShared
-- Name: !#ALF:Hacktool:Win32/Nosogo.H!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & RPF:AnyFileHasIOAVURL

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = mp.IOAVGetDownloadUrl()
  if l_0_0 ~= nil and string.len(l_0_0) > 30 and l_0_0:find(":3000/attacks/download?", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
