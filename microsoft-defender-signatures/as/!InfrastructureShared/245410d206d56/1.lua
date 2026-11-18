-- Threat: !InfrastructureShared
-- Name: 245410d206d56
-- Type: 21

local l_0_0 = 8
for l_0_1 = 1, 50 do
  if l_0_0 < 1 then
    return mp.CLEAN
  end
  if sigattr_head[l_0_1].attribute == 12429 then
    mp.set_mpattribute("SIGATTR:AntiEmuRaceThread")
    return mp.CLEAN
  end
  if sigattr_head[l_0_1].attribute ~= 12362 then
    l_0_0 = l_0_0 - 1
  end
end
return mp.CLEAN
