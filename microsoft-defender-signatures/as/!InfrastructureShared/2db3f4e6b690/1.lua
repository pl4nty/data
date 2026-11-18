-- Threat: !InfrastructureShared
-- Name: 2db3f4e6b690
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
else
  return mp.CLEAN
end
if l_0_0 ~= "" then
  if string.match(l_0_0, "%.[a-z]+$") or string.match(l_0_0, "%.[a-z]+\"$") or string.find(l_0_0, "\\downloads\\", 1, true) then
    return mp.CLEAN
  else
    return mp.INFECTED
  end
end
return mp.CLEAN
