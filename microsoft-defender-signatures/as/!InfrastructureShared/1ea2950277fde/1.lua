-- Threat: !InfrastructureShared
-- Name: 1ea2950277fde
-- Type: 21

mp.readprotection(false)
local l_0_0 = mp.getfilesize()
if 20480 < l_0_0 then
  local l_0_1 = tostring(mp.readfile(l_0_0 - 9472, 8192))
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, "https://icam%.cl/wp%-content/%.%.%./%.%.%./x3%.php") ~= nil or string.find(l_0_1, "https://smartcheckautos%.com/wp%-content/%.%.%./%.%.%./x3%.php") ~= nil or string.find(l_0_1, "url:https://calfeutragebprs%.com/wp%-content/image/s3%.php") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
