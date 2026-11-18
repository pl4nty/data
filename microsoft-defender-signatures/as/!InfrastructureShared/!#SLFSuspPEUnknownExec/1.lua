-- Threat: !InfrastructureShared
-- Name: !#SLF:SuspPEUnknownExec
-- Type: 10
-- MpAttributes: pea_no_security & pea_32bitmachine & pea_isexe & !pea_isdll & !pea_isdriver & !pea_isvbnative & !pea_ismsil

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.getfilesize()
  if 1048576 < l_0_1 then
    return mp.CLEAN
  end
  local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_2:find("cache\\", 1, true) or l_0_3:find(".json", 1, true) or l_0_3:find(".pyd", 1, true) or l_0_3:find(".xml", 1, true) or l_0_3:find(".lng", 1, true) then
    return mp.CLEAN
  end
  if l_0_2:find("appdata", 1, true) or l_0_2:find("programdata", 1, true) or mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and mp.GetMOTWZone() >= 3 then
    if epcode[1] == 232 or epcode[1] == 233 or epcode[1] == 85 and (epcode[2] == 139 or epcode[2] == 137) or epcode[1] == 75 and epcode[2] == 131 or epcode[1] == 106 and epcode[2] == 96 or epcode[3] == 85 and epcode[1] == 139 or epcode[1] == 131 then
      return mp.CLEAN
    end
    local l_0_4 = pe.get_versioninfo()
    if l_0_4 ~= nil then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
