-- Threat: !InfrastructureShared
-- Name: 1c29e5b060bf
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {"/.bashrc", "/.zshrc"}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_3, -1 * #l_0_3, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
