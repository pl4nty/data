-- Threat: !InfrastructureShared
-- Name: !#AlignAttribsWithContext
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 ~= mp.SCANREASON_ONOPEN and l_0_1 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  if l_0_1 == mp.SCANREASON_UNKNOWN then
    if mp.GetResmgrBasePlugin() == "file" then
      l_0_0 = mp.getfilename()
      if not sysio.IsFileExists(l_0_0) then
        return mp.CLEAN
      end
    else
      return mp.CLEAN
    end
  else
    return mp.CLEAN
  end
end
if l_0_0 == nil then
  l_0_0 = mp.getfilename()
end
if not mp.get_mpattribute("BM_AgePrevLookedUpForBITS") and MpCommon.QueryPersistContext(l_0_0, "BM_AgePrevLookedUpForBITS") then
  mp.set_mpattribute("BM_AgePrevLookedUpForBITS")
end
if not mp.get_mpattribute("BM_BlockedForBITS") and MpCommon.QueryPersistContext(l_0_0, "BM_BlockedForBITS") then
  mp.set_mpattribute("BM_BlockedForBITS")
end
return mp.CLEAN
