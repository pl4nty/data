-- Threat: !InfrastructureShared
-- Name: !#Lua:HTML/Meadgive.AE!control
-- Type: 13

if mp.get_mpattribute("SCRIPT:HTML/Meadgive.AE!obj") then
  local l_0_0 = string.lower(tostring(headerpage))
  local l_0_1 = string.match(l_0_0, "value=\"http://%w+%.%a+%.(%a+)/%w+\"")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = {
    "date",
    "download",
    "online",
    "party",
    "pw",
    "racing",
    "review",
    "site",
    "space",
    "stream",
    "trade",
    "webcam",
    "website"
  }
  local l_0_3 = #l_0_2
  for l_0_4 = 1, l_0_3 do
    if l_0_2[l_0_4] == l_0_1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
