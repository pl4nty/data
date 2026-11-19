-- Threat: !InfrastructureShared
-- Name: 957869fdc846
-- Type: 21
-- Includes: BMLuaLib, HstrLuaLib

local l_0_0 = mp.GetHSTRCallerId()
if isnull(l_0_0) then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS ~= l_0_0 then
  if peattributes.isexe then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
  if not isnull(l_0_1) then
    if mp.IsKnownFriendlyFile(l_0_1, true, false) then
      return mp.CLEAN
    end
    local l_0_2 = string.lower(l_0_1)
    if string.find(l_0_2, "amsistream-", 1, true) then
      return mp.CLEAN
    end
  end
  if checkIfCertificateHit() then
    return mp.CLEAN
  end
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
