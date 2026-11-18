-- Threat: !InfrastructureShared
-- Name: 2db3bd31c42a
-- Type: 21

if this_sigattrlog[2].matched then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  l_0_0 = string.gsub(l_0_0, " ", "")
  if string.len(l_0_0) < 200 then
    return mp.CLEAN
  end
  if string.len(l_0_0) > 1024 then
    return mp.INFECTED
  end
  if string.find(l_0_0, "powershell", 1, true) or string.find(l_0_0, "iex(", 1, true) or string.find(l_0_0, "join[regex]::matches", 1, true) or string.find(l_0_0, "::frombase64string", 1, true) then
    return mp.INFECTED
  end
  local l_0_1 = 0
  for l_0_2 in string.gmatch(l_0_0, "^") do
    l_0_1 = l_0_1 + 1
  end
  for l_0_3 in string.gmatch(l_0_0, "'.-'%+") do
    l_0_1 = l_0_1 + 1
  end
  for l_0_4 in string.gmatch(l_0_0, "{%d%d?}{%d%d?}") do
    l_0_1 = l_0_1 + 1
  end
  if 10 <= l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
