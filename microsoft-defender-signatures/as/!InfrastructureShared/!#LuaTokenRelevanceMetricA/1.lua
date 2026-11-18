-- Threat: !InfrastructureShared
-- Name: !#Lua:TokenRelevanceMetric.A
-- Type: 13
-- MpAttributes: RPF:FileNameTokenRelevanceMetric.A & RPF:TopLevelFile & BM_MZ_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_AGE)
if l_0_1 == nil or 18000 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if l_0_2 < 256 or 5242880 < l_0_2 then
  return mp.CLEAN
end
local l_0_3 = string.lower(mp.getfilename())
if l_0_3:find("cache", 1, true) or l_0_3:find("crypto", 1, true) or l_0_3:find("\\scans\\", 1, true) then
  return mp.CLEAN
end
local l_0_4 = mp.GetCertificateInfo(false)
for l_0_5, l_0_6 in pairs(l_0_4) do
  if l_0_6.Signers ~= nil then
    return mp.CLEAN
  end
end
mp.set_mpattribute("Lua:FileNameTokenRelevanceMetric.A")
return mp.CLEAN
