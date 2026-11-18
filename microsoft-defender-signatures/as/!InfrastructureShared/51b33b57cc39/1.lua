-- Threat: !InfrastructureShared
-- Name: 51b33b57cc39
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
else
  return mp.CLEAN
end
if not l_0_0 then
  return mp.CLEAN
end

function hexToAscii(l_1_0)
  local l_1_1 = {}
  for l_1_2 = 1, #l_1_0, 2 do
    l_1_1[#l_1_1 + 1] = string.char(tonumber(l_1_0:sub(l_1_2, l_1_2 + 1), 16))
  end
  return table.concat(l_1_1, "")
end

for l_0_1 in string.gmatch(l_0_0, "(%x%x%x%x[%x]+)") do
  if l_0_1:find("^68747470") then
    l_0_1 = hexToAscii(l_0_1)
    bm.add_related_string("bmurl", l_0_1, bm.RelatedStringBMReport)
  else
    l_0_1 = hexToAscii(l_0_1)
    bm.add_related_file(l_0_1)
  end
end
return mp.INFECTED
