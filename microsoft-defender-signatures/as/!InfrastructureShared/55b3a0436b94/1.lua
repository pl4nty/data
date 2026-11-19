-- Threat: !InfrastructureShared
-- Name: 55b3a0436b94
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
for l_0_2 = 1, l_0_0 do
  if sigattr_tail[l_0_2].attribute == 16384 or sigattr_tail[l_0_2].attribute == 16385 or sigattr_tail[l_0_2].attribute == 16386 then
    local l_0_3 = sigattr_tail[l_0_2].utf8p1:lower()
    l_0_1[mp.crc32(0, l_0_3, 1, #l_0_3)] = 1
  end
end
local l_0_4 = 0
for l_0_5 = 1, l_0_0 do
  if sigattr_tail[l_0_5].attribute == 16389 and sigattr_tail[l_0_5].utf8p2 == "ATTR_a280babb" and sigattr_tail[l_0_5].utf8p1 ~= nil then
    local l_0_6 = sigattr_tail[l_0_5].utf8p1:lower()
    local l_0_7 = mp.crc32(0, l_0_6, 1, #l_0_6)
    if l_0_1[l_0_7] == 1 then
      l_0_4 = l_0_4 + 1
    end
  end
end
if 5 < l_0_4 then
  sms_untrusted_process()
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
