-- Threat: !InfrastructureShared
-- Name: 91b3fc328445
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(bm.get_imagepath())
  if string.match(string.sub(l_0_0, -11), "_keygen.exe") and this_sigattrlog[5].matched and this_sigattrlog[6].matched then
    local l_0_1 = string.lower(mp.utf16to8(this_sigattrlog[5].wp1))
    local l_0_2 = string.lower(mp.utf16to8(this_sigattrlog[6].wp1))
    if l_0_1 ~= nil and l_0_2 ~= nil and string.match(string.sub(l_0_1, -9), "%d%d%d%d%.exe") and string.match(string.sub(l_0_2, -9), "%d%d%d%d%.exe") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
