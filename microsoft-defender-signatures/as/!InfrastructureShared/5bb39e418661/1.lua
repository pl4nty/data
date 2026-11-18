-- Threat: !InfrastructureShared
-- Name: 5bb39e418661
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = ""
local l_0_2 = ""
local l_0_3 = ""
local l_0_4 = {}
for l_0_5 = 1, l_0_0 do
  if sigattr_tail[l_0_5].attribute == 16385 and sigattr_tail[l_0_5].utf8p2 ~= 0 and sigattr_tail[l_0_5].utf8p2 ~= "" then
    local l_0_6 = sigattr_tail[l_0_5].utf8p2:lower()
    local l_0_7 = {}
    for l_0_8, l_0_9 in string.gmatch(l_0_6, "(%w+):(%w+)") do
      l_0_7[l_0_8] = l_0_9
    end
    l_0_1 = scrubData(l_0_7.usrname)
    l_0_2 = scrubData(l_0_7.domain)
    l_0_3 = l_0_7.remoteip
    if l_0_1 ~= nil and l_0_2 ~= nil and l_0_3 ~= nil then
      table.insert(l_0_4, {
        RemoteClientUser = l_0_1,
        RemoteClientDomain = l_0_2,
        RemoteClientIP = l_0_3
      })
    end
  end
end
if 0 < #l_0_4 then
  bm.add_related_string("RemoteClientData", safeJsonSerialize(l_0_4), bm.RelatedStringBMReport)
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
