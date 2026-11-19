-- Threat: !InfrastructureShared
-- Name: 4db36833cfcc
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0:match("\\([^\\]+)$"))
  local l_0_2 = {
    ["windbg.exe"] = true,
    ["svchost.exe"] = true,
    tmp000000ed = true
  }
  if l_0_2[l_0_1] then
    return mp.INFECTED
  end
end
return mp.CLEAN
