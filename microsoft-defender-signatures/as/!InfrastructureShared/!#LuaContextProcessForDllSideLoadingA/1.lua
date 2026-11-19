-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/ProcessForDllSideLoading.A
-- Type: 10
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  local l_0_0 = {BM_Process_Hacker_EXE = ""}
  local l_0_1, l_0_2
  for l_0_3, l_0_4 in pairs(l_0_0) do
    if mp.get_mpattribute(l_0_3) then
      l_0_1 = l_0_3
      l_0_2 = string.lower(l_0_4)
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
  if 0 < #l_0_2 and l_0_2 == l_0_5 then
    return mp.CLEAN
  end
  local l_0_6 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_6:sub(1, 8) == "\\device\\" then
    l_0_6 = MpCommon.PathToWin32Path(l_0_6)
    if l_0_6 == nil then
      return mp.CLEAN
    end
    l_0_6 = string.lower(l_0_6)
  end
  if l_0_6:sub(1, 4) == "\\\\?\\" then
    l_0_6 = l_0_6:sub(5)
  end
  local l_0_7 = l_0_6 .. "\\" .. l_0_5
  local l_0_8 = "CheckPossibleDllSideLoadingA"
  local l_0_9 = MpCommon.QueryPersistContext(l_0_7, l_0_8)
  if not l_0_9 then
    MpCommon.AppendPersistContext(l_0_7, l_0_8, 100)
    return mp.INFECTED
  end
end
return mp.CLEAN
