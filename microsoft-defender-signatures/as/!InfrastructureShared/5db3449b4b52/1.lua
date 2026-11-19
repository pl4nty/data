-- Threat: !InfrastructureShared
-- Name: 5db3449b4b52
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  if string.byte(l_0_0) == string.byte("%") then
    if string.match(l_0_0, "%%localappdata%%\\[^\\]+\\") == nil then
      return mp.INFECTED
    elseif string.match(l_0_0, "%%localappdata%%\\[^\\]+\\$") ~= nil then
      return mp.INFECTED
    else
      return mp.CLEAN
    end
  elseif string.match(l_0_0, "\\local\\[^\\]+\\") == nil then
    return mp.INFECTED
  elseif string.match(l_0_0, "\\local\\[^\\]+\\$") ~= nil then
    return mp.INFECTED
  else
    return mp.CLEAN
  end
end
return mp.CLEAN
