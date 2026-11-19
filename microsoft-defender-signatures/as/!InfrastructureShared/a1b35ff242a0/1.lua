-- Threat: !InfrastructureShared
-- Name: a1b35ff242a0
-- Type: 21

if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[4].utf8p2
  if string.find(l_0_0, "/u ", 1, true) and string.find(l_0_0, "/s ", 1, true) then
    local l_0_1
    if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
      l_0_1 = this_sigattrlog[1].utf8p2
    elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
      l_0_1 = this_sigattrlog[2].utf8p2
    elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
      l_0_1 = this_sigattrlog[3].utf8p2
    end
    if l_0_1 ~= nil then
      local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
      for l_0_3, l_0_4 in ipairs(l_0_2) do
        if sysio.IsFileExists(l_0_4) then
          bm.add_related_file(l_0_4)
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
