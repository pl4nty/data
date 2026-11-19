-- Threat: !InfrastructureShared
-- Name: 1929cb21d638
-- Type: 21

local l_0_0 = mp.getfilesize()
if not l_0_0 or 1024000 < l_0_0 or headerpage == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(tostring(headerpage))
if l_0_1 == nil or 5000 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = l_0_1:match("'([^']+)'%-split'([^']+)'")
if not l_0_2 or not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = l_0_2
local l_0_5 = l_0_2:gsub(l_0_3, "")
if l_0_4 ~= "iex" and l_0_5 == "iex" then
  return mp.INFECTED
end
if l_0_4 ~= "new-object" and l_0_5 == "new-object" then
  mp.set_mpattribute("SCPT:Win32/WinLNK.HEM1")
end
if l_0_4 ~= "downloadstring" and l_0_5 == "downloadstring" then
  mp.set_mpattribute("SCPT:Win32/WinLNK.HEM1")
end
return mp.CLEAN
