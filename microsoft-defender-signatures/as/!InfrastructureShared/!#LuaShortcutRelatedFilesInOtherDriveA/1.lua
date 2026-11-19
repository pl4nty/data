-- Threat: !InfrastructureShared
-- Name: !#Lua:ShortcutRelatedFilesInOtherDrive.A
-- Type: 13
-- MpAttributes: Lua:FileBaseFolderInOtherDrive & BM_LNK_FILE & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = tostring(headerpage)
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    local l_0_5 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_4))
    if sysio.IsFileExists(l_0_5) then
      mp.ReportLowfi(l_0_5, 1875954900)
    end
  end
end
return mp.CLEAN
