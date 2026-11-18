-- Threat: !InfrastructureShared
-- Name: 63b3b384b800
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[3].matched and this_sigattrlog[4].matched then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  local l_0_2 = string.lower(this_sigattrlog[3].utf8p2)
  local l_0_3 = string.lower(this_sigattrlog[4].utf8p2)
  if l_0_1 ~= nil and l_0_2 ~= nil and l_0_3 ~= nil then
    local l_0_4
    for l_0_5, l_0_6 in ipairs(l_0_1) do
      l_0_4 = tostring(l_0_6) .. ".crypt"
      if string.find(l_0_2, l_0_4, 1, true) and string.find(l_0_3, l_0_4, 1, true) and string.find(l_0_3, tostring(l_0_6), 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
