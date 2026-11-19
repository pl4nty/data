-- Threat: !InfrastructureShared
-- Name: 43d0f5615b65
-- Type: 21

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_0 ~= nil then
  local l_0_1 = mp.GetProcessCommandLine(l_0_0)
  local l_0_2 = string.match(l_0_1, "[Ww][Ii][Nn][Ww][Oo][Rr][Dd]%.[Ee][Xx][Ee]\".+\"(.+%.[Dd][Oo][Cc][MmXx]?\"-)")
  if l_0_2 ~= nil and string.len(l_0_2) > 3 and sysio.IsFileExists(l_0_2) then
    mp.ReportLowfi(l_0_2, 1344846517)
    return mp.INFECTED
  end
end
return mp.INFECTED
