-- Threat: !InfrastructureShared
-- Name: 4a2990ae1308
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {
  "Microsoft Edge",
  "dlp_edge.log"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_3, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
