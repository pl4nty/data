-- Threat: !InfrastructureShared
-- Name: a1b335e90312
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
else
  return mp.CLEAN
end
local l_0_1 = string.lower(bm.get_imagepath())
if string.find(l_0_1, "\\program files", 1, true) or string.find(l_0_1, "\\windows\\system32\\svchost.exe", 1, true) or string.find(l_0_1, "\\sources\\setup", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if sysio.IsFileExists(l_0_4) then
    bm.add_related_file(l_0_4)
    if not MpCommon.QueryPersistContext(l_0_4, "T1547.001") then
      MpCommon.AppendPersistContext(l_0_4, "T1547.001", 0)
    end
  end
end
return mp.INFECTED
