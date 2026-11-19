-- Threat: !InfrastructureShared
-- Name: f1b3475745df
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 == nil then
  return mp.CLEAN
end
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = "svchost.exe|taskeng.exe|taskhostw.exe"
    local l_0_5 = string.lower(string.match(l_0_3.image_path, "\\([^\\]+)$"))
    if l_0_5 ~= nil and string.find(l_0_4, l_0_5) then
      local l_0_6 = "c:\\windows\\system32\\tasks"
      mp.TriggerScanResource("folder", l_0_6)
    else
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
