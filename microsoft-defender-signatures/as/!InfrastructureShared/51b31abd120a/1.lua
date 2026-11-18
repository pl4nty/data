-- Threat: !InfrastructureShared
-- Name: 51b31abd120a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "\\windows\\ccm\\systemtemp\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
mp.TriggerScanResource("wmi", "")
reportSessionInformation()
return mp.INFECTED
