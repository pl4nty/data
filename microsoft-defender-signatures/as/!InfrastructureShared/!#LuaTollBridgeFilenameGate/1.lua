-- Threat: !InfrastructureShared
-- Name: !#Lua:TollBridgeFilenameGate
-- Type: 13

local l_0_0 = mp.enum_mpattributesubstring("SCPT:TollBridge.")
if l_0_0 == nil or #l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2 = {
  ".cat",
  ".mum",
  "xva"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
local l_0_5 = {
  "bridge",
  "vpn",
  "server",
  "conf",
  "zip",
  "soft",
  "sofether"
}
for l_0_6, l_0_7 in ipairs(l_0_5) do
  if string.find(l_0_1, l_0_7, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
