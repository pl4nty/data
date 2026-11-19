-- Threat: !InfrastructureShared
-- Name: 2fb39b78ef5b
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if string.byte(l_0_0) == string.byte("%") then
    if (string.match(l_0_0, "%%appdata%%\\%a+\\%a+%.exe$") or string.match(l_0_0, "%%appdata%%\\%x+\\%a+%.exe$")) and string.match(l_0_0, "\\[b-t][aeiou][b-t][aeiou]%a+%.exe$") then
      return mp.INFECTED
    end
  elseif (string.match(l_0_0, "\\appdata\\roaming\\%a+\\%a+%.exe$") or string.match(l_0_0, "\\appdata\\roaming\\%x+\\%a+%.exe$")) and string.match(l_0_0, "\\[b-t][aeiou][b-t][aeiou]%a+%.exe$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
