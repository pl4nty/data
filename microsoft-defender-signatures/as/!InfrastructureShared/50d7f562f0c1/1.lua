-- Threat: !InfrastructureShared
-- Name: 50d7f562f0c1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "clloud",
  "veriffy",
  "vcloudix.com",
  "leaveannealoan.com",
  "iftyworld.com",
  ".ocfreestuff.com",
  ".landersarena.com",
  "clrverify.com",
  "verikldx",
  "unreadiness.pics",
  "oswyka.com",
  "vericloudone",
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
  "correioobjetotransportes.com",
  "outspanned.mom",
  "cl-verify.com",
  "vf-files.com",
  "solpendi.com",
  "kopewv.com",
  ".dewynterspromos.com"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
return mp.INFECTED
