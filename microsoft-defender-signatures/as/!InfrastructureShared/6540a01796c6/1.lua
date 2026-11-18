-- Threat: !InfrastructureShared
-- Name: 6540a01796c6
-- Type: 21

local l_0_0 = mp.SIGATTR_LOG_SZ
if mp.SIGATTR_LOG_SZ >= 3 then
  l_0_0 = 3
end
for l_0_1 = 1, l_0_0 do
  local l_0_2 = mp.SIGATTR_LOG_SZ - l_0_1 + 1
  if sigattr_tail[l_0_2].matched and sigattr_tail[l_0_2].attribute == 12312 then
    local l_0_3 = sigattr_tail[l_0_2].p1
    if string.len(l_0_3) ~= 71 or l_0_3:sub(-4) ~= ".exe" or string.byte(l_0_3, -21) ~= 92 or l_0_3:sub(-38, -22) ~= "\\Application Data" then
      break
    end
    local l_0_4 = l_0_3:sub(-20)
    if string.byte(l_0_4) < 65 or string.byte(l_0_4) > 90 then
      break
    end
    local l_0_5 = string.len(l_0_4)
    for l_0_6 = 2, l_0_5 - 4 do
      local l_0_7 = string.byte(l_0_4, l_0_6)
      if l_0_7 < 97 or 122 < l_0_7 then
        break
      end
    end
    mp.set_mpattribute("SIGATTR:DorkbotFileName.A")
    return mp.INFECTED
  end
end
return mp.CLEAN
