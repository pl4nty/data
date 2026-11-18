-- Threat: !InfrastructureShared
-- Name: a378a38e1e29
-- Type: 21
-- Includes: BMLuaLib, HstrLuaLib

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if not isnull(l_0_0) and mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_1 = mp.GetCertificateInfo()
if not isnull(l_0_1) then
  for l_0_2, l_0_3 in pairs(l_0_1) do
    if l_0_3.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
if checkIfCertificateHit() then
  return mp.CLEAN
end
return mp.INFECTED
