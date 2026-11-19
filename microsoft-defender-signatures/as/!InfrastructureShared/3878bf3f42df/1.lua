-- Threat: !InfrastructureShared
-- Name: 3878bf3f42df
-- Type: 21
-- Includes: BMLuaLib, HstrLuaLib

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
if not isnull(l_0_0) then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
if checkIfCertificateHit() then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if not isnull(l_0_3) and mp.IsKnownFriendlyFile(l_0_3, true, false) then
  return mp.CLEAN
end
return mp.INFECTED
