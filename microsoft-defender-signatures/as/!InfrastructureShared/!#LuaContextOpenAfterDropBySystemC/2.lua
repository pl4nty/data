-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/OpenAfterDropBySystem.C
-- Type: 13

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_0:sub(1, 8) == "\\device\\" then
    l_0_0 = MpCommon.PathToWin32Path(l_0_0)
    if l_0_0 == nil then
      return mp.CLEAN
    end
    l_0_0 = string.lower(l_0_0)
  end
  local l_0_1 = false
  local l_0_2 = MpCommon.GetPersistContext(l_0_0)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = {
    SuspExeFileDroppedBySystemProcessC_sysdir = "Lua:Context/OpenExeAfterDropBySystem.C!sysdir",
    SuspFileDroppedBySystemProcessC_sysdir = "Lua:Context/OpenAfterDropBySystem.C!sysdir",
    SuspExeFileDroppedBySystemProcessC_windir = "Lua:Context/OpenExeAfterDropBySystem.C!windir",
    SuspFileDroppedBySystemProcessC_windir = "Lua:Context/OpenAfterDropBySystem.C!windir"
  }
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    for l_0_6, l_0_7 in pairs(l_0_3) do
      if l_0_5 == l_0_6 then
        mp.set_mpattribute(l_0_7)
        l_0_1 = true
      end
    end
  end
  if l_0_1 == true then
    return mp.INFECTED
  end
end
return mp.CLEAN
