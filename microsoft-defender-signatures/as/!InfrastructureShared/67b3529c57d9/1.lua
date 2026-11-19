-- Threat: !InfrastructureShared
-- Name: 67b3529c57d9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
local l_0_1 = false
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2:lower()
end
if not contains(l_0_0, "process.*call.*create", false) then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4, l_0_5 = string.find(l_0_0, "/node%s*:([^%s]+).-call create ['\"]([^\r\n]+)['\"]")
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = {
  "BTS FIX Gateway",
  "besclient",
  "epr.bat",
  "ADSelfService Plus"
}
if contains(l_0_5, l_0_6) then
  return mp.CLEAN
end
if contains(l_0_5, "cmd.*/c", false) and contains(l_0_5, {
  " regsvr32",
  " rundll32",
  " wscript",
  " cscript",
  " mshta",
  " bitsadmin"
}) then
  l_0_1 = true
end
if l_0_1 then
  bm.add_related_string("WMICRemoteNode", tostring(l_0_4), bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
