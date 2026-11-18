-- Threat: !InfrastructureShared
-- Name: 3bb3bab426a5
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p1
  l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
end
if l_0_2 ~= nil then
  if #l_0_2 ~= 20 then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_1) then
    l_0_0 = sysio.GetFileSize(l_0_1)
    if l_0_0 < 6291456 or 8388608 < l_0_0 then
      return mp.CLEAN
    end
    l_0_1 = string.lower(l_0_1)
    local l_0_3 = l_0_1:match("temp\\([a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z][a-z])\\")
    if l_0_3 ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
