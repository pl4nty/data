-- Threat: !InfrastructureShared
-- Name: 2db36c365d37
-- Type: 21

if this_sigattrlog[2].matched then
  local l_0_0 = this_sigattrlog[2].utf8p1
  if l_0_0 ~= nil then
    local l_0_1 = string.lower(string.sub(l_0_0, -20))
    if string.find(l_0_1, "\\microsoftedgecp.exe", 1, true) or string.find(l_0_1, "\\werfault.exe", 1, true) or string.find(l_0_1, "\\wmiprvse.exe", 1, true) or string.find(l_0_1, "\\mfpmp.exe", 1, true) then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
