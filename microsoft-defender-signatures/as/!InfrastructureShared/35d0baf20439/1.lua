-- Threat: !InfrastructureShared
-- Name: 35d0baf20439
-- Type: 21
-- Includes: BMLuaLib, ResearchData

local l_0_0 = mp.getfilesize()
if 268435456 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = {
  "cache",
  "-wal",
  "\\temp\\",
  ".tmp"
}
local l_0_2 = mp.getfilename()
if l_0_2 then
  l_0_2 = string.lower(l_0_2)
  if contains(l_0_2, l_0_1) then
    return mp.CLEAN
  end
end
local l_0_3 = 16777216
if l_0_0 < l_0_3 then
  l_0_3 = l_0_0
end
local l_0_4 = mp.BMSearchFile(0, l_0_3, "\243\160\129\174\243\160\129\179\243\160\129\180\243\160\129\178\243\160\129\181\243\160\129\163\243\160\129\180\243\160\129\169\243\160\129\175\243\160\129\174\144\000")
if l_0_4 < 0 then
  return mp.INFECTED
end
local l_0_5 = l_0_4 - 80
if l_0_5 < 0 then
  l_0_5 = 0
end
local l_0_6 = 512
mp.readprotection(false)
local l_0_7 = mp.readfile(l_0_5, l_0_6)
mp.readprotection(true)
local l_0_8 = MpCommon.Base64Encode(l_0_7)
set_research_data("EncodedBytes", l_0_8, false)
return mp.INFECTED
