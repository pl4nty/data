-- Threat: !InfrastructureShared
-- Name: 2db3d27fed26
-- Type: 21

if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  {"whoami"},
  {"hostname"},
  {"systeminfo"},
  {"ipconfig"},
  {"netstat"},
  {"arp -a"},
  {
    "route print"
  },
  {"getmac"},
  {"nslookup"},
  {"net user"},
  {
    "net localgroup"
  },
  {"net group"},
  {"nltest"},
  {"dsquery"},
  {"tasklist"},
  {"wmic "},
  {"sc query"},
  {
    "netsh advfirewall"
  },
  {"net share"},
  {"net view"},
  {"net use"},
  {"quser"}
}
local l_0_2 = 0
for l_0_3, l_0_4 in ipairs(l_0_1) do
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    if string.find(l_0_0, l_0_6, 1, true) then
      l_0_2 = l_0_2 + 1
      break
    end
  end
  if 2 <= l_0_2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
