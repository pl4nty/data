-- Threat: !InfrastructureShared
-- Name: 41b3f4186130
-- Type: 21

if not this_sigattrlog[3].matched or not this_sigattrlog[3].wp2 then
  return mp.CLEAN
end
local l_0_0 = MpCommon.GetPersistContextNoPath("mshta_start")
if l_0_0 then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_2)
    if sysio.IsFileExists(l_0_2) and not mp.IsKnownFriendlyFile(l_0_2, false, false) then
      mp.ReportLowfi(l_0_2, 1632017330)
    end
  end
  local l_0_3 = this_sigattrlog[3].utf8p2
  if l_0_3 then
    l_0_3 = l_0_3:lower()
    if string.find(l_0_3, "windows\\ccm", 1, true) or string.find(l_0_3, "\\ccm\\systemtemp\\", 1, true) then
      return mp.CLEAN
    end
    local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_3)
    if l_0_4 then
      for l_0_5, l_0_6 in ipairs(l_0_4) do
        l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
        if sysio.IsFileExists(l_0_6) and not mp.IsKnownFriendlyFile(l_0_6, false, false) then
          mp.ReportLowfi(l_0_6, 705262311)
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
