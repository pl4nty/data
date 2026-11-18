-- Threat: !InfrastructureShared
-- Name: 19293e28880b
-- Type: 21
-- Includes: ScriptLuaLib

if mp.get_mpattribute("//SCPT:HTML/DoubleCryptoFraudKey") == false and mp.get_mpattribute("//SCPT:MSG/CryptoExtortion") == false then
  return mp.CLEAN
end
local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = l_0_0.match_offset
local l_0_2 = mp.getfilesize()
if l_0_0.is_footer then
  l_0_1 = l_0_2 - mp.FOOTERPAGE_SZ + l_0_1
end
if Infrastructure_CryptoSearcher(l_0_1) == true then
  if mp.get_mpattribute("//SCPT:HTML/DoubleCryptoFraudKey") == true then
    mp.set_mpattribute("MpInternal_researchdata=threat=double")
  end
  if mp.get_mpattribute("//SCPT:MSG/CryptoExtortion") == true then
    mp.set_mpattribute("MpInternal_researchdata=threat=extort")
  end
  return mp.INFECTED
end
return mp.CLEAN
