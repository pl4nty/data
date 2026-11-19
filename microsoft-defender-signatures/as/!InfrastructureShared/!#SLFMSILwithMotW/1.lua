-- Threat: !InfrastructureShared
-- Name: !#SLF:MSILwithMotW
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:MSIExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
  if mp.GetMOTWZone() >= 3 then
    local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
    if string.sub(l_0_1, -4) ~= ".msi" then
      return mp.CLEAN
    end
    local l_0_2 = 3759263696
    if mp.readu_u32(headerpage, 1) == l_0_2 then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
