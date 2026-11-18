-- Threat: !InfrastructureShared
-- Name: 1c7b3b37a2215
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = 5
local l_0_1 = "servicestop"
local l_0_2 = ""
local l_0_3 = {}
if this_sigattrlog[1].matched then
  l_0_2 = this_sigattrlog[1].utf8p2
  l_0_3[#l_0_3 + 1] = l_0_2:match("stop ([^%s]+)")
elseif this_sigattrlog[2].matched then
  l_0_2 = this_sigattrlog[2].utf8p2
  l_0_3[#l_0_3 + 1] = l_0_2:match("pause ([^%s]+)")
elseif this_sigattrlog[3].matched then
  l_0_2 = this_sigattrlog[3].utf8p2
  l_0_3[#l_0_3 + 1] = l_0_2:match("stop ([^%s]+)")
elseif this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].utf8p2
  l_0_3[#l_0_3 + 1] = l_0_2:match("delete ([^%s]+)")
elseif this_sigattrlog[6].matched then
  l_0_2 = this_sigattrlog[6].utf8p2
  l_0_3[#l_0_3 + 1] = l_0_2:match("/im ([^%s]+)")
elseif this_sigattrlog[7].matched then
  l_0_2 = this_sigattrlog[7].utf8p2
  l_0_3[#l_0_3 + 1] = l_0_2:match("-im ([^%s]+)")
elseif this_sigattrlog[5].matched then
  l_0_2 = this_sigattrlog[5].utf8p2
  local l_0_4 = string.match(l_0_2, "ame%s-([^%-%/]+)%s-[%-%/]")
  if string.find(l_0_4, ",", 1, true) then
    l_0_4 = string.gsub(l_0_4, " ", "")
    for l_0_5, l_0_6 in ipairs(split(l_0_4, ",")) do
      l_0_3[#l_0_3 + 1] = l_0_6
    end
  end
elseif this_sigattrlog[8].matched then
  l_0_2 = this_sigattrlog[8].utf8p2
  l_0_3[#l_0_3 + 1] = l_0_2:match("uninstall ([^%s]+)")
elseif this_sigattrlog[9].matched then
  l_0_2 = this_sigattrlog[9].utf8p2
  l_0_3[#l_0_3 + 1] = l_0_2:match("service%-where%-(['\"][^%s]+['\"])")
elseif this_sigattrlog[10].matched then
  l_0_2 = this_sigattrlog[10].utf8p2
  l_0_3[#l_0_3 + 1] = l_0_2:match("set-service ([^%s]+)")
elseif this_sigattrlog[11].matched then
  l_0_2 = this_sigattrlog[11].utf8p2
  l_0_3[#l_0_3 + 1] = l_0_2:match("(%%.*%%)")
end
if l_0_0 < #l_0_3 then
  for l_0_7, l_0_8 in pairs(l_0_3) do
    bm.add_related_string("service_kill", l_0_8, bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
for l_0_9, l_0_10 in pairs(l_0_3) do
  local l_0_11 = MpCommon.QueryPersistContextNoPath(l_0_1, l_0_10)
  if not l_0_11 then
    MpCommon.AppendPersistContextNoPath(l_0_1, l_0_10, 600)
  end
end
local l_0_12 = MpCommon.GetPersistContextCountNoPath(l_0_1)
if l_0_0 < l_0_12 then
  l_0_3 = safeJsonSerialize(MpCommon.GetPersistContextNoPath(l_0_1))
  bm.add_related_string("service_stop", l_0_3, bm.RelatedStringBMReport)
  MpCommon.SetPersistContextNoPath(l_0_1, {}, 1)
  return mp.INFECTED
end
return mp.CLEAN
