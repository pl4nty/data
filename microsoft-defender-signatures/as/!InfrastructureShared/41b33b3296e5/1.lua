-- Threat: !InfrastructureShared
-- Name: 41b33b3296e5
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  local l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
  l_0_1 = string.gsub(l_0_1, " ", "")
  l_0_1 = string.gsub(l_0_1, "\"", "")
  if l_0_0 ~= l_0_1 then
    return mp.CLEAN
  end
end
if mp.IsKnownFriendlyFile(MpCommon.PathToWin32Path(bm.get_imagepath()), true, true) == true then
  return mp.CLEAN
end
local l_0_2 = string.lower(bm.get_imagepath())
if l_0_2 and (string.find(l_0_2, "\\program files", 1, true) or string.find(l_0_2, "\\windows\\", 1, true) or string.find(l_0_2, "\\atx", 1, true) or string.find(l_0_2, "pdv\\", 1, true) or string.find(l_0_2, "\\pdv", 1, true) or string.find(l_0_2, "caixa", 1, true) or string.find(l_0_2, "\\frente", 1, true) or string.find(l_0_2, "\\setuphost", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED
