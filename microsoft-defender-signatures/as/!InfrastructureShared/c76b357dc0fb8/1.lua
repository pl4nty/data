-- Threat: !InfrastructureShared
-- Name: c76b357dc0fb8
-- Type: 21

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
for l_0_3 = 1, l_0_0 do
  if sigattr_tail[l_0_3].attribute == 16384 and sigattr_tail[l_0_3].utf8p1 and sigattr_tail[l_0_3].utf8p1:byte(1) ~= 37 then
    local l_0_4 = sigattr_tail[l_0_3].utf8p1
    if l_0_1[l_0_4] == nil then
      l_0_1[l_0_4] = l_0_3
    end
  end
end
for l_0_5, l_0_6 in pairs(l_0_1) do
  local l_0_7 = false
  for l_0_8 = 1, l_0_0 do
    if sigattr_tail[l_0_8].attribute == 16389 and sigattr_tail[l_0_8].utf8p1 == l_0_5 then
      l_0_7 = true
      break
    end
  end
  if l_0_7 == false then
    l_0_2[l_0_5] = 1
  end
end
for l_0_9, l_0_10 in pairs(l_0_2) do
  mp.TriggerScanResource("file", l_0_9)
end
return mp.CLEAN
