-- Threat: !InfrastructureShared
-- Name: 55b38101bed4
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
  if string.find(string.lower(l_0_0), "\\spool\\drivers\\", 1, true) == nil then
    local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
    if l_0_1 ~= nil then
      for l_0_2, l_0_3 in ipairs(l_0_1) do
        if sysio.IsFileExists(l_0_3) then
          bm.add_related_file(l_0_3)
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
