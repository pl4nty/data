-- Threat: !InfrastructureShared
-- Name: 67b33c42bf41
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2:lower()
end
if not contains(l_0_0, "process.*call.*create", false) then
  return mp.CLEAN
end
local l_0_1, l_0_2, l_0_3, l_0_4 = string.find(l_0_0, "/node%s*:([^%s]+).-call create ['\"]([^\r\n]+)['\"]")
if not l_0_4 then
  return mp.CLEAN
end
if contains(l_0_4, "cmd.*/c", false) and contains(l_0_4, {
  " powershell"
}) then
  bm.add_related_string("WMICRemoteNode", tostring(l_0_3), bm.RelatedStringBMReport)
  bm.add_related_string("WmiprvseRemoteProc", l_0_4, bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
