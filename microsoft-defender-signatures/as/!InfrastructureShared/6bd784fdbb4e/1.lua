-- Threat: !InfrastructureShared
-- Name: 6bd784fdbb4e
-- Type: 21

local l_0_0 = {}
table.insert(l_0_0, "https://thiscannotpossiblywork.local/")
local l_0_1 = {}
l_0_1.isLocal = "false"
l_0_1.certutil = "true"
l_0_1.E2ETestScenario = "true"
local l_0_2 = mp.GetUrlReputation(l_0_0, l_0_1)
if l_0_2 ~= nil then
  local l_0_3 = l_0_2.urls
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if l_0_5.determination == 2 and l_0_5.confidence > 60 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
