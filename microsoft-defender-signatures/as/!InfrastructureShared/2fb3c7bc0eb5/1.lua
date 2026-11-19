-- Threat: !InfrastructureShared
-- Name: 2fb3c7bc0eb5
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if string.byte(l_0_0) == string.byte("%") then
    if string.match(l_0_0, "%%appdata%%\\[^\\]+\\") == nil then
      return mp.INFECTED
    elseif string.match(l_0_0, "%%appdata%%\\[^\\]+\\$") ~= nil then
      return mp.INFECTED
    else
      return mp.CLEAN
    end
  elseif string.match(l_0_0, "\\appdata\\roaming\\[^\\]+\\") == nil then
    return mp.INFECTED
  elseif string.match(l_0_0, "\\appdata\\roaming\\[^\\]+\\$") ~= nil then
    return mp.INFECTED
  else
    return mp.CLEAN
  end
end
return mp.CLEAN
