-- Threat: !InfrastructureShared
-- Name: 4224149dc67b1
-- Type: 21
-- Includes: LuaFuncHelper

if versioning.GetTestMode() ~= 65000 and versioning.IsSampled(1000, true, true, true) == false then
  return mp.CLEAN
end
local l_0_0, l_0_1
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
  l_0_1 = 3
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
  l_0_1 = 4
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
  l_0_1 = 7
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p1
  l_0_1 = 8
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p1
  l_0_1 = 9
elseif this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p1
  l_0_1 = 10
elseif this_sigattrlog[11].matched then
  l_0_0 = this_sigattrlog[11].utf8p1
  l_0_1 = 11
elseif this_sigattrlog[12].matched then
  l_0_0 = this_sigattrlog[12].utf8p1
  l_0_1 = 13
elseif this_sigattrlog[13].matched then
  l_0_0 = this_sigattrlog[13].utf8p1
  l_0_1 = 14
elseif this_sigattrlog[14].matched then
  l_0_0 = this_sigattrlog[14].utf8p1
  l_0_1 = 19
elseif this_sigattrlog[15].matched then
  l_0_0 = this_sigattrlog[15].utf8p1
  l_0_1 = 20
elseif this_sigattrlog[16].matched then
  l_0_0 = this_sigattrlog[16].utf8p1
  l_0_1 = 21
elseif this_sigattrlog[17].matched then
  l_0_0 = this_sigattrlog[17].utf8p1
  l_0_1 = 22
elseif this_sigattrlog[18].matched then
  l_0_0 = this_sigattrlog[18].utf8p1
  l_0_1 = 23
elseif this_sigattrlog[19].matched then
  l_0_0 = this_sigattrlog[19].utf8p1
  l_0_1 = 26
elseif this_sigattrlog[20].matched then
  l_0_0 = this_sigattrlog[20].utf8p1
  l_0_1 = 27
elseif this_sigattrlog[21].matched then
  l_0_0 = this_sigattrlog[21].utf8p1
  l_0_1 = 30
elseif this_sigattrlog[22].matched then
  l_0_0 = this_sigattrlog[22].utf8p1
  l_0_1 = 31
elseif this_sigattrlog[23].matched then
  l_0_0 = this_sigattrlog[23].utf8p1
  l_0_1 = 32
elseif this_sigattrlog[24].matched then
  l_0_0 = this_sigattrlog[24].utf8p1
  l_0_1 = 34
elseif this_sigattrlog[25].matched then
  l_0_0 = this_sigattrlog[25].utf8p1
  l_0_1 = 38
elseif this_sigattrlog[26].matched then
  l_0_0 = this_sigattrlog[26].utf8p1
  l_0_1 = 40
elseif this_sigattrlog[27].matched then
  l_0_0 = this_sigattrlog[27].utf8p1
  l_0_1 = 56
elseif this_sigattrlog[28].matched then
  l_0_0 = this_sigattrlog[28].utf8p1
  l_0_1 = 57
elseif this_sigattrlog[29].matched then
  l_0_0 = this_sigattrlog[29].utf8p1
  l_0_1 = 58
elseif this_sigattrlog[30].matched then
  l_0_0 = this_sigattrlog[30].utf8p1
  l_0_1 = 99
elseif this_sigattrlog[31].matched then
  l_0_0 = this_sigattrlog[31].utf8p1
  l_0_1 = 100
elseif this_sigattrlog[32].matched then
  l_0_0 = this_sigattrlog[32].utf8p1
  l_0_1 = 101
elseif this_sigattrlog[33].matched then
  l_0_0 = this_sigattrlog[33].utf8p1
  l_0_1 = 102
elseif this_sigattrlog[34].matched then
  l_0_0 = this_sigattrlog[34].utf8p1
  l_0_1 = 103
elseif this_sigattrlog[35].matched then
  l_0_0 = this_sigattrlog[35].utf8p1
  l_0_1 = 104
elseif this_sigattrlog[36].matched then
  l_0_0 = this_sigattrlog[36].utf8p1
  l_0_1 = 105
elseif this_sigattrlog[37].matched then
  l_0_0 = this_sigattrlog[37].utf8p1
  l_0_1 = 106
elseif this_sigattrlog[38].matched then
  l_0_0 = this_sigattrlog[38].utf8p1
  l_0_1 = 107
elseif this_sigattrlog[39].matched then
  l_0_0 = this_sigattrlog[39].utf8p1
  l_0_1 = 108
elseif this_sigattrlog[40].matched then
  l_0_0 = this_sigattrlog[40].utf8p1
  l_0_1 = 109
elseif this_sigattrlog[41].matched then
  l_0_0 = this_sigattrlog[41].utf8p1
  l_0_1 = 253
elseif this_sigattrlog[42].matched then
  l_0_0 = this_sigattrlog[42].utf8p1
  l_0_1 = 254
elseif this_sigattrlog[43].matched then
  l_0_0 = this_sigattrlog[43].utf8p1
  l_0_1 = 259
else
  return mp.CLEAN
end
local l_0_2 = lastIndexOf(l_0_0, ".", #l_0_0 - 7)
local l_0_3 = string.lower(string.sub(l_0_0, l_0_2 + 1))
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = l_0_3 .. "_" .. l_0_1
l_0_0 = string.lower(l_0_0)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_5, l_0_6 = mp.CheckUrl(l_0_0)
if l_0_5 == 1 and l_0_6 == 1 then
  return mp.CLEAN
end
local l_0_7 = MpCommon.QueryPersistContextNoPath("deprecatedDnsRecordType", l_0_4)
if not l_0_7 then
  MpCommon.AppendPersistContextNoPath("deprecatedDnsRecordType", l_0_4, 3600)
end
local l_0_8 = MpCommon.GetPersistContextCountNoPath("deprecatedDnsRecordType")
if 5 < l_0_8 then
  return mp.INFECTED
end
return mp.CLEAN
