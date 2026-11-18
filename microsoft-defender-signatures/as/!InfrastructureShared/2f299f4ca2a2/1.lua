-- Threat: !InfrastructureShared
-- Name: 2f299f4ca2a2
-- Type: 21
-- Includes: ScriptLuaLib

local l_0_0 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat1")
local l_0_1 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat2")
local l_0_2 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat3")
if 1 <= #l_0_0 or 5 <= #l_0_1 or 3 <= #l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.enum_mpattributesubstring("SCPT:RansomNote")
if #l_0_3 < 1 then
  return mp.CLEAN
end
local l_0_4 = mp.GetBruteMatchData()
local l_0_5 = l_0_4.match_offset
local l_0_6 = mp.getfilesize()
if l_0_4.is_footer then
  l_0_5 = l_0_6 - mp.FOOTERPAGE_SZ + l_0_5
end
if Infrastructure_CryptoSearcher(l_0_5) == true then
  mp.set_mpattribute("MpInternal_researchdata=threat=ransom")
  return mp.INFECTED
end
return mp.CLEAN
