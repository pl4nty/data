-- Threat: !InfrastructureShared
-- Name: 2db348a0b323
-- Type: 21

local l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\History")
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = sysio.GetRegValueAsString(l_0_0, "MachineDomain")
if l_0_1 == nil or #l_0_1 < 1 then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_2 = string.lower(this_sigattrlog[1].utf8p2)
  if sysio.IsFileExists(l_0_2) then
    bm.add_related_file(l_0_2)
  end
end
return mp.INFECTED
