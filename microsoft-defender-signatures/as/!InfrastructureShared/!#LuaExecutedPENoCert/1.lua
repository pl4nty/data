-- Threat: !InfrastructureShared
-- Name: !#Lua:ExecutedPENoCert
-- Type: 11
-- MpAttributes: Lua:EXEExt & Lua:TopLevelUnsigned

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  local l_0_0 = mp.getfilesize()
  if 8388608 <= l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if string.sub(l_0_1, 0, 4) == "\\\\?\\" then
    l_0_1 = string.sub(l_0_1, 5)
  end
  if l_0_1:sub(1, 8) == "\\device\\" then
    l_0_1 = MpCommon.PathToWin32Path(l_0_1)
    if l_0_1 == nil then
      return mp.CLEAN
    end
    l_0_1 = string.lower(l_0_1)
  end
  local l_0_2 = MpCommon.QueryPersistContext(l_0_1, "ExecutedPENoCert")
  if not l_0_2 then
    MpCommon.AppendPersistContext(l_0_1, "ExecutedPENoCert", 0)
  end
end
return mp.CLEAN
