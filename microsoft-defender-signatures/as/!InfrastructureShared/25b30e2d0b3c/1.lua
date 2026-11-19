-- Threat: !InfrastructureShared
-- Name: 25b30e2d0b3c
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_4.image_path ~= nil and l_0_4.ppid ~= nil then
    local l_0_5 = mp.bitand(l_0_4.reason_ex, 1)
    if l_0_5 == 1 then
      local l_0_6 = string.lower(l_0_4.image_path)
      if l_0_6 ~= nil and l_0_0 == l_0_6 then
        bm.request_SMS(l_0_4.ppid, "M")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
