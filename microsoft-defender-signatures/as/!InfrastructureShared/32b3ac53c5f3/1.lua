-- Threat: !InfrastructureShared
-- Name: 32b3ac53c5f3
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1
if string.find(l_0_0, "/cp", -3, true) or string.find(l_0_0, "/mv", -3, true) or string.find(l_0_0, "/wget", -5, true) or string.find(l_0_0, "/curl", -5, true) then
  local l_0_2 = mp.GetParentProcInfo()
  if l_0_2 ~= nil and l_0_2.ppid ~= nil then
    l_0_1 = l_0_2.ppid
  end
end
local l_0_3
if l_0_1 then
  _, l_0_3 = bm.get_process_relationships(l_0_1)
else
  _, l_0_3 = bm.get_process_relationships()
end
for l_0_4, l_0_5 in ipairs(l_0_3) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_5.ppid)
end
return mp.INFECTED
