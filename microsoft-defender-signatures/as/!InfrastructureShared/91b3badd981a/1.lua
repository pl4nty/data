-- Threat: !InfrastructureShared
-- Name: 91b3badd981a
-- Type: 21

function add_it(l_1_0)
  if string.find(string.lower(l_1_0), "powershell%.exe") == nil then
    bm.add_related_file(mp.ContextualExpandEnvironmentVariables(l_1_0))
  end
end

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  for l_0_1 in string.gmatch(l_0_0, "\"[^\"]+%.exe\"") do
    add_it(string.sub(l_0_1, 2, -2))
  end
  for l_0_2 in string.gmatch(l_0_0, "\"[^\"]+%.exe\\\"") do
    add_it(string.sub(l_0_2, 2, -3))
  end
  for l_0_3 in string.gmatch(l_0_0, "%a:[^:\"]+%.exe") do
    add_it(l_0_3)
  end
  for l_0_4 in string.gmatch(l_0_0, "\\\\[^:\"]+%.exe") do
    add_it(l_0_4)
  end
  for l_0_5 in string.gmatch(l_0_0, "\"[^\"]+%.ps1\"") do
    add_it(string.sub(l_0_5, 2, -2))
  end
  for l_0_6 in string.gmatch(l_0_0, "%a:[^:\"]+%.ps1") do
    add_it(l_0_6)
  end
  for l_0_7 in string.gmatch(l_0_0, "\\\\[^:\"]+%.ps1") do
    add_it(l_0_7)
  end
  for l_0_8 in string.gmatch(l_0_0, "\"[^\"]+%.bat\"") do
    add_it(string.sub(l_0_8, 2, -2))
  end
  for l_0_9 in string.gmatch(l_0_0, "%a:[^:\"]+%.bat") do
    add_it(l_0_9)
  end
  for l_0_10 in string.gmatch(l_0_0, "\\\\[^:\"]+%.bat") do
    add_it(l_0_10)
  end
  for l_0_11 in string.gmatch(l_0_0, "\"[^\"]+%.dll\"") do
    add_it(string.sub(l_0_11, 2, -2))
  end
  for l_0_12 in string.gmatch(l_0_0, "%a:[^:\"]+%.dll") do
    add_it(l_0_12)
  end
  for l_0_13 in string.gmatch(l_0_0, "\\\\[^:\"]+%.dll") do
    add_it(l_0_13)
  end
end
return mp.INFECTED
