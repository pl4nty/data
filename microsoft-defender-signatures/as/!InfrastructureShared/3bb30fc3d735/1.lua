-- Threat: !InfrastructureShared
-- Name: 3bb30fc3d735
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if string.byte(l_0_0) == string.byte("%") then
    if string.match(l_0_0, "%%program_files%%\\[^\\]+\\") == nil then
      return mp.INFECTED
    elseif string.match(l_0_0, "%%program_files%%\\[^\\]+\\$") ~= nil then
      return mp.INFECTED
    else
      return mp.CLEAN
    end
  elseif string.match(l_0_0, "^[%a]:\\[^\\]+\\[^\\]+\\") == nil then
    return mp.INFECTED
  elseif string.match(l_0_0, "^[%a]:\\[^\\]+\\[^\\]+\\$") ~= nil then
    return mp.INFECTED
  else
    return mp.CLEAN
  end
end
return mp.CLEAN
