-- Threat: !InfrastructureShared
-- Name: d6b3ef7dc9a2
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
end
l_0_1 = bm.get_current_process_startup_info()
if isnull(l_0_0) or isnull(l_0_0.utf8p1) or isnull(l_0_0.utf8p2) or isnull(l_0_1) or isnull(l_0_1.ppid) then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.match(l_0_0.utf8p2, "^([0-9]+);regionsize:([0-9]+)")
local l_0_4 = string.match(l_0_0.utf8p1, "^([0-9]+:[0-9]+)")
if isnull(l_0_2) or isnull(l_0_3) or isnull(l_0_4) or tonumber(l_0_3) >= 100 then
  return mp.CLEAN
end
local l_0_5 = bm.GetProcAddress(l_0_1.ppid, "amsi.dll", "AmsiScanBuffer")
if isnull(l_0_5) then
  return mp.CLEAN
end
local l_0_6, l_0_7 = bm.VirtualQuery(l_0_5)
if not l_0_6 or l_0_7.base_addr ~= tonumber(l_0_2) then
  return mp.CLEAN
end
local l_0_8 = {
  function_name = "AmsiScanBuffer",
  amsi_address = l_0_5,
  prot_base_addr = l_0_2,
  prot_constant = l_0_4,
  region_size = l_0_3
}
local l_0_9 = safeJsonSerialize(l_0_8)
bm.add_related_string("AMSIPatchEDR", l_0_9, bm.RelatedStringBMReport)
bm.set_detection_string(l_0_9)
return mp.INFECTED
