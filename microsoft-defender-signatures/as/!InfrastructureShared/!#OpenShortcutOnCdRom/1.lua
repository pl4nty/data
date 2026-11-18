-- Threat: !InfrastructureShared
-- Name: !#OpenShortcutOnCdRom
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & BM_LNK_FILE

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
if not l_0_0:find("^\\device\\cdrom[0-9][0-9]?$") then
  return mp.CLEAN
end
local l_0_1 = false
local l_0_2, l_0_3
l_0_2 = mp.GetLnkInfo()
l_0_3 = l_0_2.BasePath
if l_0_3 then
  l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
  l_0_3 = l_0_3:lower()
  local l_0_4 = MpCommon.ExpandEnvironmentVariables("%systemdrive%")
  if l_0_4 then
    l_0_4 = l_0_4:lower()
    if l_0_3:sub(1, 2) == l_0_4 then
      mp.set_mpattribute("Lua:OpenLnkCrossVolume_CdToSys")
      l_0_1 = true
    end
  end
end
if not l_0_1 then
  local l_0_5 = l_0_2.RelativePath
  if l_0_5 and l_0_5:find("^%.%.") then
    mp.set_mpattribute("Lua:OpenLnkCrossVolume_CdToSysRel")
    l_0_1 = true
  end
end
if l_0_1 then
  if l_0_3 and not mp.IsKnownFriendlyFile(l_0_3, false, false) then
    mp.ReportLowfi(l_0_3, 441180191)
  end
  if l_0_2 and l_0_2.Arguments then
    local l_0_6 = mp.GetExecutablesFromCommandLine(l_0_2.Arguments)
    if l_0_6 then
      for l_0_7, l_0_8 in ipairs(l_0_6) do
        l_0_8 = mp.ContextualExpandEnvironmentVariables(l_0_8)
        if sysio.IsFileExists(l_0_8) and not mp.IsKnownFriendlyFile(l_0_3, false, false) then
          mp.ReportLowfi(l_0_8, 441180191)
        end
      end
    end
  end
end
return mp.CLEAN
