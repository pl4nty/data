-- Threat: !InfrastructureShared
-- Name: 4db3239bd394
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].wp1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].wp1
end
if l_0_0 ~= nil then
  local l_0_1 = mp.utf16to8(l_0_0)
  if string.find(l_0_1, ":\\\194\160\\[%w%s%p]+$") and string.find(l_0_1, ":\\\194\160\\[^\\]+$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
