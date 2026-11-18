-- Threat: !InfrastructureShared
-- Name: 57b33bd2b514
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3 ~= nil and l_0_3.reason_ex ~= nil and l_0_3.ppid ~= nil then
    local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
    if l_0_4 == 1 then
      bm.add_threat_process(l_0_3.ppid)
      break
    end
  end
end
return mp.INFECTED
