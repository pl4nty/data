-- Threat: !InfrastructureShared
-- Name: b0b3f0ab4ac9
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "\\program files", 1, true) and not string.find(l_0_1, "\\python", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.enum_mpattributesubstring("Behavior:")
if #l_0_2 == 0 or l_0_2 == nil then
  return mp.CLEAN
end
for l_0_3, l_0_4 in ipairs(l_0_2) do
  bm.add_related_string("RelatedBMHits", l_0_4, bm.RelatedStringBMReport)
end
return mp.INFECTED
