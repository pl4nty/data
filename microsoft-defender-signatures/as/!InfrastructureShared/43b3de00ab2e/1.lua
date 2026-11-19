-- Threat: !InfrastructureShared
-- Name: 43b3de00ab2e
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  local l_0_0 = string.lower(mp.utf16to8(this_sigattrlog[1].wp2))
  if string.find(l_0_0, ".downloadstring", 1, true) ~= nil then
    if (string.find(l_0_0, "-dumpcreds", 1, true) ~= nil and string.find(l_0_0, "-computername", 1, true)) ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
