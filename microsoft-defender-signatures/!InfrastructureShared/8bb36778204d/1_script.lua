-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8bb36778204d\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil and (this_sigattrlog[5]).utf8p2 ~= nil then
  local l_0_0 = (string.lower)((this_sigattrlog[5]).utf8p1)
  local l_0_1 = (string.lower)((this_sigattrlog[5]).utf8p2)
  if (string.find)(l_0_1, ";apkg:ntlm;tsid:s-1-5-21-", 1, true) then
    local l_0_2 = l_0_0:match("ip:(.+)")
    local l_0_3 = scrubData(l_0_1:match("tsid:([^;]+)"))
    local l_0_4 = scrubData(l_0_1:match("tn:([^;]+)"))
    local l_0_5 = scrubData(l_0_1:match("tdn:([^;]+)"))
    l_0_1 = "tsid:PII_" .. l_0_3 .. ";tn:PII_" .. l_0_4 .. ";tdn:PII_" .. l_0_5
    AppendToRollingQueue("has_networklogonsuccess", l_0_2, l_0_1, 15)
  end
end
do
  return mp.CLEAN
end

