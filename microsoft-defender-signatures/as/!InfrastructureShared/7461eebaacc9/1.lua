-- Threat: !InfrastructureShared
-- Name: 7461eebaacc9
-- Type: 21

if mp.get_mpattribute("MpNewlyCreatedHint") and (mp.get_mpattribute("BM_MZ_FILE") or mp.get_mpattribute("BM_MZ_DLL")) and mp.get_mpattribute("RPF:TopLevelFile") then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
  if l_0_0 ~= nil then
    local l_0_1 = string.lower(l_0_0)
    if string.find(l_0_1, "\\program files", 1, true) ~= nil or string.find(l_0_1, "\\windows\\", 1, true) ~= nil then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
