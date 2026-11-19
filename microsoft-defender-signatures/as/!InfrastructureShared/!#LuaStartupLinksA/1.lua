-- Threat: !InfrastructureShared
-- Name: !#Lua:StartupLinks.A
-- Type: 13
-- MpAttributes: //RPF:IS_Lnk

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.getfilename())
  if string.match(l_0_1, "\\microsoft\\windows\\start menu\\programs\\startup.*%.lnk") ~= nil then
    local l_0_2 = string.lower(tostring(headerpage))
    local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
      if sysio.IsFileExists(l_0_5) then
        mp.ReportLowfi(l_0_5, 2199264473)
      end
    end
  end
end
return mp.CLEAN
