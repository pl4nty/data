-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/PossibleDllPreloading.B!persistcontext
-- Type: 10
-- Includes: Path
-- MpAttributes: MpOnOpenOrCloseRtpScan

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  local l_0_0 = {
    BM_FaceFodUninstaller_EXE = "facefoduninstaller.exe",
    BM_POWERSHELL_EXE = "powershell.exe",
    BM_RUNDLL32_EXE = "rundll32.exe",
    BM_OSK_EXE = "osk.exe"
  }
  local l_0_1, l_0_2
  for l_0_3, l_0_4 in pairs(l_0_0) do
    if mp.get_mpattribute(l_0_3) then
      l_0_1 = l_0_3
      l_0_2 = l_0_4
      break
    end
  end
  if l_0_1 == nil or l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_5 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_5 == nil then
    return mp.CLEAN
  end
  if 0 < #l_0_2 and string.lower(l_0_2) == l_0_5 then
    return mp.CLEAN
  end
  local l_0_6 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  l_0_6 = normalize_path(l_0_6)
  local l_0_7 = l_0_6 .. "\\" .. l_0_5
  local l_0_8 = MpCommon.QueryPersistContext(l_0_7, l_0_1)
  if not l_0_8 then
    MpCommon.AppendPersistContext(l_0_7, l_0_1, 100)
    return mp.INFECTED
  end
end
return mp.CLEAN
