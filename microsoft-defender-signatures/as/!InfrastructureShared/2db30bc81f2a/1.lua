-- Threat: !InfrastructureShared
-- Name: 2db30bc81f2a
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 ~= nil and string.find(l_0_0, "\\windows10upgrade%d+%.exe") ~= nil then
  return mp.CLEAN
end
if this_sigattrlog[1].matched then
  local l_0_1 = string.lower(mp.utf16to8(this_sigattrlog[1].wp1))
  if l_0_1 ~= nil and string.find(l_0_1, "\\windows10upgrade\\", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
