-- Threat: !InfrastructureShared
-- Name: 73d7a6cfce5a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "clloud",
  "veriffy",
  "clrverify.com",
  "unreadiness.pics",
  "oswyka.com",
  "anselber",
  "vrfycloudx.com",
  "veriqloudx.com",
  "vericlyd.com",
  "clouddverify",
  "vericloudz.com",
  "kerewz.com",
  "cl-verify.com",
  "fermigz.com",
  "verify-clients",
  "Verifica\195\167\195\163o",
  "correioobjetotransportes.com",
  "outspanned.mom",
  "cl-verify.com",
  "vf-files.com",
  "solpendi.com",
  "kopewv.com",
  "vcloudix.com"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
return mp.CLEAN
