-- Threat: !InfrastructureShared
-- Name: 12bd76e8185ba
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "%.vg[');/|]",
  "%.cc[');/|]",
  "%.gl[');/|]"
}
local l_0_3 = 1
while true do
  local l_0_4, l_0_5 = string.find(l_0_1, "http", l_0_3, true)
  if not l_0_4 then
    break
  end
  local l_0_6 = string.sub(l_0_1, l_0_5 + 1, l_0_5 + 64)
  for l_0_7, l_0_8 in ipairs(l_0_2) do
    if string.find(l_0_6, l_0_8) then
      return mp.INFECTED
    end
  end
  l_0_3 = l_0_5 + 1
end
return mp.CLEAN
