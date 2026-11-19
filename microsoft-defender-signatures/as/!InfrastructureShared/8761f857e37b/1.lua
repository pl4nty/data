-- Threat: !InfrastructureShared
-- Name: 8761f857e37b
-- Type: 21

if peattributes.isexe == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  if not mp.get_mpattribute("RPF:TopLevelFile") then
    return mp.CLEAN
  end
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0:find("program files", 1, true) then
    return mp.CLEAN
  end
  if l_0_0:find("system32", 1, true) then
    return mp.CLEAN
  end
  if l_0_0:find("syswow64", 1, true) then
    return mp.CLEAN
  end
  if l_0_0:find("winsxs", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilesize()
  if 1000000 < l_0_1 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
