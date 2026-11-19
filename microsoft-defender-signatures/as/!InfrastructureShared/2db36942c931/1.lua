-- Threat: !InfrastructureShared
-- Name: 2db36942c931
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(mp.utf16to8(this_sigattrlog[1].wp1))
  if l_0_0 ~= nil and string.find(l_0_0, "\\%d+%.exe") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
