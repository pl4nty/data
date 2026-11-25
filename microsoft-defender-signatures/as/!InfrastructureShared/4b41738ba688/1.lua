-- Threat: !InfrastructureShared
-- Name: 4b41738ba688
-- Type: 21

local l_0_0 = versioning.GetOrgID()
local l_0_1 = 100
if type(l_0_0) == "string" then
  l_0_0 = l_0_0:lower()
  if l_0_0 == "26e8b179-9fbe-40fd-8f34-37cdee8c4766" or l_0_0 == "e6e2b814-cd64-4ac3-9e16-91753ff30617" or l_0_0 == "bcfa1838-fccc-4999-9d5b-5ec1ac1a4776" then
    l_0_1 = 25000
  end
end
if versioning.IsSampled(l_0_1, false, false, false) ~= true then
  return mp.CLEAN
end
local l_0_2 = nri.GetRawRequestBlob()
local l_0_3 = nri.GetRawResponseBlob()
if type(l_0_2) ~= "string" or type(l_0_3) ~= "string" then
  return mp.CLEAN
end
local l_0_4 = l_0_2:byte(1)
if l_0_4 == 4 then
  if #l_0_2 < 9 or #l_0_3 < 8 or l_0_2:byte(2) ~= 1 and l_0_2:byte(2) ~= 2 or l_0_3:byte(1) ~= 0 or l_0_3:byte(2) < 90 or l_0_3:byte(2) > 93 then
    return mp.CLEAN
  end
  local l_0_5 = l_0_2:sub(1, 4096)
  local l_0_6 = l_0_5:find("\000", 9, true)
  if not l_0_6 then
    return mp.CLEAN
  end
  if l_0_2:byte(5) == 0 and l_0_2:byte(6) == 0 and l_0_2:byte(7) == 0 and l_0_2:byte(8) ~= 0 then
    local l_0_7 = l_0_5:find("\000", l_0_6 + 1, true)
    if not l_0_7 or l_0_7 == l_0_6 + 1 then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
if l_0_4 ~= 5 or #l_0_2 < 3 or #l_0_3 < 2 or l_0_3:byte(1) ~= 5 then
  return mp.CLEAN
end
local l_0_8 = l_0_2:byte(2)
local l_0_9 = l_0_3:byte(2)
if l_0_8 == 0 or #l_0_2 < 2 + l_0_8 or l_0_9 == 255 then
  return mp.CLEAN
end
local l_0_10 = false
for l_0_11 = 3, 2 + l_0_8 do
  if l_0_2:byte(l_0_11) == 255 then
    return mp.CLEAN
  end
  if l_0_2:byte(l_0_11) == l_0_9 then
    l_0_10 = true
  end
end
if l_0_10 then
  return mp.INFECTED
end
return mp.CLEAN
