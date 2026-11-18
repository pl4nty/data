-- Threat: !InfrastructureShared
-- Name: !#Lua:BMLowfiTrigger
-- Type: 11
-- MpAttributes: RPF:TopLevelFile & Lua:EXEExt & BM_LowfiTrigger

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
  local l_0_2 = {}
  local l_0_3 = mp.enum_mpattributesubstring("SLF:")
  if #l_0_3 ~= 0 and l_0_3 ~= nil then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      table.insert(l_0_2, l_0_5)
    end
  end
  local l_0_6 = mp.enum_mpattributesubstring("ALF:")
  if #l_0_6 ~= 0 and l_0_6 ~= nil then
    for l_0_7, l_0_8 in ipairs(l_0_6) do
      table.insert(l_0_2, l_0_8)
    end
  end
  local l_0_9 = mp.enum_mpattributesubstring("TEL:")
  if #l_0_9 ~= 0 and l_0_9 ~= nil then
    for l_0_10, l_0_11 in ipairs(l_0_9) do
      table.insert(l_0_2, l_0_11)
    end
  end
  if #l_0_2 ~= 0 and l_0_2 ~= nil then
    for l_0_12, l_0_13 in ipairs(l_0_2) do
      if not string.find(l_0_13, "!rfn", 1, true) and not string.find(l_0_13, "HeraklezEval", 1, true) and not string.find(l_0_13, "ASRCALL", 1, true) then
        local l_0_14 = MpCommon.QueryPersistContext(l_0_1, l_0_13)
        if not l_0_14 then
          MpCommon.AppendPersistContext(l_0_1, l_0_13, 180)
        end
      end
    end
  end
  local l_0_15 = MpCommon.QueryPersistContext(l_0_1, "BMLowfiTrigger")
  if not l_0_15 then
    mp.set_mpattribute("MpDisableCaching")
    MpCommon.AppendPersistContext(l_0_1, "BMLowfiTrigger", 180)
  end
  return mp.INFECTED
end
return mp.CLEAN
