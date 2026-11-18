-- Threat: !InfrastructureShared
-- Name: 15b3b2b9c2d1
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  local l_0_1, l_0_2, l_0_3 = pcall(bm.get_process_relationships, l_0_0.ppid)
  if l_0_1 then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      if l_0_5 ~= nil and l_0_5.ppid ~= nil then
        bm.request_SMS(l_0_5.ppid, "m")
      end
    end
  end
end
return mp.INFECTED
