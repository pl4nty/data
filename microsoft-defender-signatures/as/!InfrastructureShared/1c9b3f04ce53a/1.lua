-- Threat: !InfrastructureShared
-- Name: 1c9b3f04ce53a
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil or not string.match(l_0_0, "/bin/%a*sh") and not string.find(l_0_0, "busybox", 1, true) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[8].matched and this_sigattrlog[8].wp2 ~= nil then
  l_0_1 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and this_sigattrlog[9].wp2 ~= nil then
  l_0_1 = this_sigattrlog[9].utf8p2
end
if l_0_1 ~= nil and string.match(l_0_1, "https?://") then
  if string.find(l_0_1, "chmod +x", 1, true) or string.find(l_0_1, "chmod 777", 1, true) then
    return mp.INFECTED
  end
  if string.find(l_0_1, "|sh", 1, true) or string.find(l_0_1, "| sh", 1, true) or string.find(l_0_1, "|bash", 1, true) or string.find(l_0_1, "| bash", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
