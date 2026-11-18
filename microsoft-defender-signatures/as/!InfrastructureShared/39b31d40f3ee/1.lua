-- Threat: !InfrastructureShared
-- Name: 39b31d40f3ee
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if (string.match(l_0_0, "%%localappdata%%\\%a+\\%a+%.exe$") or string.match(l_0_0, "%%localappdata%%\\{%x+%-%x+%-%x+%-%x+%-%x+}\\%a+%.exe$")) and string.match(l_0_0, "\\[b-t][aeiou][b-t][aeiou]%a+%.exe$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
