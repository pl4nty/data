-- Threat: !InfrastructureShared
-- Name: 15294b8938fb
-- Type: 21

if mp.get_mpattributesubstring("PACKED_WITH:[Base64Decode]") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 12288 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetBruteMatchData()
local l_0_2 = l_0_1.match_offset
mp.set_mpattributeex("SCRIPT:Base64StrStart.A", l_0_2)
return mp.CLEAN
