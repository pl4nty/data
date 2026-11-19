-- Threat: !InfrastructureShared
-- Name: 61293baa872f
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = {
  ".deb",
  ".iso",
  ".img"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_3, -1 * #l_0_3, true) then
    return mp.CLEAN
  end
end
local l_0_4 = {
  "kali",
  ".dpkg",
  ".deb-",
  ".iso-",
  ".img-"
}
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if string.find(l_0_0, l_0_6, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
