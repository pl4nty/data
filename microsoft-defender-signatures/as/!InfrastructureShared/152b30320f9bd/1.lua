-- Threat: !InfrastructureShared
-- Name: 152b30320f9bd
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].utf8p2
end
if not l_0_0 or not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = {}
for l_0_3 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_3].matched and sigattr_tail[l_0_3].attribute == 16400 then
    local l_0_4 = sigattr_tail[l_0_3].utf8p2
    if l_0_4 ~= nil and not string.find(l_0_4, "chmod", 1, true) and not string.find(l_0_4, "rm", 1, true) then
      table.insert(l_0_2, l_0_4)
    end
  end
end
local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_6, l_0_7 in ipairs(l_0_5) do
  l_0_7 = mp.ContextualExpandEnvironmentVariables(l_0_7)
  if string.find(l_0_1, l_0_7, 1, true) then
    for l_0_8, l_0_9 in ipairs(l_0_2) do
      if string.find(l_0_9, l_0_7, 1, true) then
        bm.add_related_file(l_0_7)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
