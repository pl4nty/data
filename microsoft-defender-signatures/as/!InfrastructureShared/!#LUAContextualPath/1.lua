-- Threat: !InfrastructureShared
-- Name: !#LUA:ContextualPath
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & !BM_UNKNOWN_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.enum_mpattributesubstring("BM_")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = mp.enum_mpattributesubstring("SLF:")
  if l_0_2 == nil then
    local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
    if l_0_3:sub(2, 9) ~= "window" and l_0_3:sub(2, 9) ~= "progra" then
      local l_0_4 = "Evaluation:" .. l_0_3
      if MpCommon.GetPersistContextCountNoPath(l_0_4) > 10 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
