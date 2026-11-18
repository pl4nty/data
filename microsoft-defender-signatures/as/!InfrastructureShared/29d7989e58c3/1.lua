-- Threat: !InfrastructureShared
-- Name: 29d7989e58c3
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 30 then
  return mp.CLEAN
end
for l_0_2 in string.gmatch(l_0_1, "%w+:%w+") do
  local l_0_3 = string.match(l_0_2, "%w+:%w+")
  if l_0_3 ~= nil then
    local l_0_4 = string.match(l_0_3, "%w+")
    local l_0_5 = string.match(l_0_3, ":%w+")
    if #l_0_4 == 12 and #l_0_5 == 21 then
      return mp.LOWFI
    end
  end
end
return mp.CLEAN
