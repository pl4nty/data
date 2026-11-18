-- Threat: !InfrastructureShared
-- Name: 105b343ce45e8
-- Type: 21

local l_0_0
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p1)
end
if l_0_0 == nil or #l_0_0 < 48 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\\\admin$\\\\", 1, true) or string.find(l_0_0, "\\[a-z]%$\\") then
  local l_0_1 = string.lower(MpCommon.PathToWin32Path(l_0_0))
  if l_0_1 ~= nil and string.sub(l_0_1, 0, 2) == "\\\\" then
    return mp.INFECTED
  end
end
return mp.CLEAN
