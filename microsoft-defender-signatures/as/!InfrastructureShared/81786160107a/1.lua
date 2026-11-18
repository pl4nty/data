-- Threat: !InfrastructureShared
-- Name: 81786160107a
-- Type: 21
-- Includes: BMLuaLib, HstrLuaLib

local l_0_0 = mp.GetHSTRCallerId()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if not isnull(l_0_1) and 2000000 < l_0_1 then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS ~= l_0_0 then
  if peattributes.isexe then
    return mp.CLEAN
  end
  local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
  if not isnull(l_0_2) and mp.IsKnownFriendlyFile(l_0_2, true, false) then
    return mp.CLEAN
  end
  if checkIfCertificateHit() then
    return mp.CLEAN
  end
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
