-- Threat: !InfrastructureShared
-- Name: d4b3a740523d
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if l_0_0 ~= nil and (string.find(l_0_0, "which", 1, true) or string.find(l_0_0, "whereis", 1, true)) then
  local l_0_1 = {
    "gcc",
    "python",
    "nc",
    "wget",
    "curl",
    "lynx",
    "apache"
  }
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if string.find(l_0_0, l_0_3, 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
